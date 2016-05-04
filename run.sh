if [ ! -f /etc/radvd.conf ] ; then
    if [ -z "$ADVERTISE_PREFIX" ]; then
        echo >&2 "Please specify -e ADVERTISE_PREFIX=foo"
        exit 1
    fi
    cat > /etc/radvd.conf <<EOF
interface ethbr4
{
   AdvSendAdvert on;
   prefix ${ADVERTISE_PREFIX}/64
   {
        AdvOnLink on;
        AdvAutonomous on;
   };
};
EOF
fi

mkdir -p /var/run/radvd
radvd -n -d 1 -m stderr
echo "radvd exited with code $?"
exit 2
