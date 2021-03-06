#! /bin/bash
# Copyright (c) 2012, Intel Corporation.
# All rights reserved.
#
# This program is free software;  you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation; either version 2 of the License, or
# (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY;  without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See
# the GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program;  if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA
#
if [ `pwd` != $HOME ] ;then
  echo "Please cd $HOME before running this command"
  exit 1
fi
if [ `stat -fc%t:%T "$1"` = `stat -fc%t:%T "$1/.."` ]; then
    echo "$1 safe is already close"
    exit 1
fi
if [ "$#" -ne 1 ] || [ ! -d "$1" ]; then
    echo "Usage:"
    echo "closesafe.sh directory-relative-path-to-home"
    exit 1
fi
echo deconnecting safe $1
fusermount -u ~/$1
echo !!! file created in $1  dir will NOT be encrypted from now
echo     use opensafe.sh to reactivate safe
