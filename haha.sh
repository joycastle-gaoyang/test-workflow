#!/bin/sh

export github_event_name=delete

# 添加 mirror 源
if [ `git remote -v | awk '{print $1}' | grep mirror | wc -l` = 0 ]; then
    git remote add mirror git@github.com:joycastle-gaoyang/test-mirror-2.git
fi

if [ "${github_event_name}" == "create" ] || [ "${github_event_name}" == "push" ]; then
    echo "create or push"
    git checkout ${github_ref_name}
    git pull
    git push mirror ${github_ref_name}
elif [ "${github_event_name}" == "delete" ]; then
    echo "delete"
    git push -d mirror ${github_ref_name}
else
    echo "not support"
fi


# github.event_name

# git checkout ${{ github.ref_name }}
# git pull -p


# git push mirror 

# export mirror = `$()`
#           git checkout ${{ github.ref_name }}
#           echo "${{github.ref_name}}",
#           echo "${{github.ref_name}}".

