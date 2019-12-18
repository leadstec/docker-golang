#!/bin/bash

#
# setup for golang
#
function runonce_golang() {

    notify title "GOLANG: Initialize container settings ..."

    # Fixing working directory permissions
    lcs-cli setup permission --section golang

    # Determine new install or updating
    if [[ ${LCS_NEW_INSTALL} == true ]]; then
        # initial envs from user inputs and defaults
        lcs-cli setup env --section golang && source ${ENVS_FILE}
    else
        notify success "GoLang Restored."
    fi

    # copy public key for python user
    if [[ ${ENABLE_SSHD} == 'true' ]]; then
        EMAIL_USER=$(echo ${EMAIL/@*})
        cat /root/keys/${EMAIL_USER}/id_rsa.pub >> /home/golang/.ssh/authorized_keys
        chown golang:golang /home/golang/.ssh/authorized_keys
        notify success "public key for golang user copied."
    fi

    notify title "GOLANG: Initialization completed."
}
