#!/bin/base

TRASH_DIR="${HOME}/.trashs"

mvtotrash() {
    # brew install coreutils
    # alias data="gdate"
    nowtime=`date "+%Y%m%d_%H%M%S.%3N"`
    # nowtime=`date "+%F %T"`

    count=0
    files=$*

    target_dir="${TRASH_DIR}/${nowtime}"
    while [ -d ${target_dir} ];do
        ((count++))
        target_dir="${TRASH_DIR}/${files}_${nowtime}_${count}"
    done

    mkdir -p ${target_dir}

    touch ${target_dir}/._meta
    echo "#\!/bin/bash" >> ${target_dir}/._meta
    echo "" >> ${target_dir}/._meta

    for file in ${files}; do
        if [ -f ${file} -o -d ${file} ];then
            filename=$(ls ${file} | sed "s:^:`pwd`/:")
            if [ -d ${file} ]; then
                filename=$(pwd)/${file}
            fi
            echo "mv ${target_dir}/${file} ${filename}" >> ${target_dir}/._meta
            mv ${file} ${target_dir}
        else
            echo "Delete fail: \""${file}"\" No such file or directory" 
        fi
    done

    for i in 2 1 0
    do
        if [ "${i}" = "2" ]; then
            if [ -h ${TRASH_DIR}/last_delete_${i} ]; then
                unlink ${TRASH_DIR}/last_delete_${i}
            fi
        elif [ -h ${TRASH_DIR}/last_delete_${i} ]; then
            next=$(expr ${i} + 1)
            mv ${TRASH_DIR}/last_delete_${i} ${TRASH_DIR}/last_delete_${next}
        fi
    done

    ln -s ${target_dir} ${TRASH_DIR}/last_delete_0

    echo "Target Trash Location:" ${target_dir}
}

rmhistory() {
    echo "Last Removed:"
    echo ""

    for i in 0 1 2
    do
        if [ -h ${TRASH_DIR}/last_delete_${i} ]; then
            lastpwd=`pwd`
            cd ${TRASH_DIR}/last_delete_${i}
            echo "======== ${i} ========"
            pwd -P | awk -F '/' '{print $NF}'
            ls -lah
            echo ""
            cd $lastpwd
        fi
    done
}

rmrollback() {
    echo "Rollback List:"
    echo ""

    for i in 0 1 2
    do
        if [ -h ${TRASH_DIR}/last_delete_${i} ]; then
            lastpwd=`pwd`
            cd ${TRASH_DIR}/last_delete_${i}
            echo "=> ${i} :" `pwd -P | awk -F '/' '{print $NF}'`
            cd $lastpwd
        fi
    done

    echo "Select Number To Rollback :>"
    read last

    if [ -L ${TRASH_DIR}/last_delete_${last} ]; then
        echo ">>>>>>>>>>>>>>>"
        cat ${TRASH_DIR}/last_delete_${last}/._meta
        echo "<<<<<<<<<<<<<<<"
        sh ${TRASH_DIR}/last_delete_${last}/._meta
        echo "Done."
    else
        echo "Invalid Number "${last}
    fi
}

emptytrach() {
    rm -rf ${HOME}/.trashs/*
}