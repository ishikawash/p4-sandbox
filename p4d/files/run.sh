#!/bin/bash -ex

# Linux package-based installation
# ref: https://www.perforce.com/manuals/p4sag/Content/P4SAG/install.linux.packages.html

if [ -e ${P4ROOT} ]; then
    p4dctl start master
else
    mkdir -p -v ${P4ROOT}
    /opt/perforce/sbin/configure-helix-p4d.sh master -n \
        -p ${P4PORT} \
        -r ${P4ROOT} \
        -u ${P4USER} \
        -P ${P4PASSWD} \
        --unicode \
        --case 0
fi

# Do tail p4d log file, instead of executing p4d in forground.
tail -f ${P4ROOT}/logs/log
