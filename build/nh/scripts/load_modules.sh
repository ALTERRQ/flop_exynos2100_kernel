#!/system/bin/sh

MODDIR=${0%/*}
KODIR="$MODDIR/modules"

is_loaded() {
    modname=$(printf '%s' "$1" | tr '-' '_')
    lsmod | awk -v m="$modname" '$1==m{f=1} END{exit !f}'
}

remaining=""
total=0
already=0
for ko in "$KODIR"/*.ko; do
    [ -e "$ko" ] || continue
    total=$((total + 1))
    base=$(basename "$ko" .ko)
    if is_loaded "$base"; then
        already=$((already + 1))
    else
        remaining="$remaining $ko"
    fi
done

if [ "$already" -eq "$total" ]; then
    echo "All $total module(s) already loaded, nothing to do"
else
    echo "$already/$total module(s) loaded, $((total - already)) to load"
fi

pass=0
progress=1
while [ "$progress" -eq 1 ] && [ -n "$remaining" ]; do
    pass=$((pass + 1))
    progress=0
    still=""
    for ko in $remaining; do
        base=$(basename "$ko" .ko)
        insmod "$ko" 2>/dev/null
        if is_loaded "$base"; then
            progress=1
            echo "  Pass $pass: loaded $base"
        else
            still="$still $ko"
        fi
    done
    remaining="$still"
done

failed=0
for ko in $remaining; do
    base=$(basename "$ko" .ko)
    echo "  FAILED to load $base (missing dependency?)"
    failed=$((failed + 1))
done

newly=$((total - already - failed))
loaded=$((already + newly))
if [ "$already" -lt "$total" ]; then
    echo "Done: $loaded/$total loaded ($already already loaded, $newly newly loaded) in $pass pass(es)"
fi

failed_names=""
for ko in "$KODIR"/*.ko; do
    [ -e "$ko" ] || continue
    base=$(basename "$ko" .ko)
    if ! is_loaded "$base"; then
        if [ -n "$failed_names" ]; then
            failed_names="$failed_names, $base"
        else
            failed_names="$base"
        fi
    fi
done

description=$(sed -n 's/^description=//p' "$MODDIR/module.prop")

if [ "$total" -eq 0 ]; then
    description="$description
  STATUS: No kernel modules can be found inside $KODIR"
elif [ -z "$failed_names" ]; then
    description="$description
  STATUS: $loaded/$total module(s) loaded • All OK"
    description="$description
  STATUS: $loaded/$total module(s) loaded • $failed failed: $failed_names"
fi

ksud module config set override.description "$description" >/dev/null 2>&1
