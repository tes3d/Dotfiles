#!/bin/sh

LOCAL_REPOSITORY_PATH="$HOME/Dotfiles"
REMOTE_REPOSITORY_URL="git://gist.github.com/tes3d/dotfiles.git"

abort() {
  [ "$1" ] && echo "Error: $1" || echo "Error"

  exit 1
}

getManagedDotfiles() {
  result=()

  cd $LOCAL_REPOSITORY_PATH

  for file in .??*; do
    case $file in
      ".git" | ".gitignore")
        ;;
      *)
        result+=($file)
        ;;
    esac
  done

  cd

  echo ${result[@]}
}

if [ -d $LOCAL_REPOSITORY_PATH ]; then
  echo "$LOCAL_REPOSITORY_PATH already exists. Do you want to reinstall? [Y/n]"
  read input

  case $input in
    "Y")
      files=($(getManagedDotfiles))
      for file in ${files[@]}; do
        if [ -e "$HOME/$file" ]; then
          rm "$HOME/$file"
        fi
      done

      rm -fr $LOCAL_REPOSITORY_PATH
      ;;
    *)
      abort "Installation has been canceled."
      ;;
  esac
fi

git clone --recursive $REMOTE_REPOSITORY_URL $LOCAL_REPOSITORY_PATH

if [ ! -d "$LOCAL_REPOSITORY_PATH/.git" ]; then
  abort "Could not download remote repository."
fi

files=($(getManagedDotfiles))
for file in ${files[@]}; do
  ln -fs "$LOCAL_REPOSITORY_PATH/$file" "$HOME/$file"
done