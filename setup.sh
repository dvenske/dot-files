#!/bin/bash

git_exists = false
zsh_exists = false
z = false
g = false

if hash git 2>/dev/null; then
  $git_exits=true
elif zsh 2>/dev/null; then
  $zsh_exists=true
fi


# TODO check to see if zsh and git already exist
# Get/set arguments -> flags
while getopts ":z:g:" o; do
  case "${o}" in
    z)
      $z = true
      ;;
    g)
      $g = true
      ;;
    *)
      ;;
  esac
done
shift $((OPTIND-1))

# Find out what operating system we're using
if hash apt-get 2>/dev/null; then
  oper='ubuntu'
elif hash yum 2>/dev/null; then
  oper='fedora'
elif hash emerge 2>/dev/null; then
  oper='gentoo'
else
  oper='unknown'
fi

# TODO Copy dot files from this directory to home

# Move current dot files to backup
# TODO check for ~/dotfilebackup directory
# TODO if the directory exists, ask the user if they would like to clear it out
# TODO if it exists, clear and move
mkdir ~/dotfilebackup
cd ~
mv .zshrc .screenrc .vim .vimrc ~/dotfilebackup

# TODO eventuall turn this into a loop that constructs a line to be executed
if [ \( $oper -ne 'unknown' ) ]
then
  # Add zsh
  if [ \( $zsh_exists -ne false -a $z -eq true ) ]
  then
    if [ \( $oper -eq 'ubuntu' ) ]
    then
      # TODO install zsh for ubuntu
    elif [ \( $oper -eq 'fedora' ) ]
    then
      # TODO install zsh for fedora
    elif [ \( $oper -eq 'gentoo' ) ]
    then
      # TODO install zsh for gentoo
    fi
  fi

  # Add git
  if [ \( $git_exists -ne false -a $g -eq true ) ]
  then
    if [ \( $oper -eq 'ubuntu' ) ]
    then
      # TODO install git for ubuntu
    elif [ \( $oper -eq 'fedora' ) ]
    then
      # TODO install git for fedora
    elif [ \( $oper -eq 'gentoo' ) ]
    then
      # TODO install git for gentoo
    fi
  fi
else
  echo "Could not install zsh or git; your operating system is not supported"
fi

# Remove backups, if flag is set
rm -rf ~/dotfilebackup
