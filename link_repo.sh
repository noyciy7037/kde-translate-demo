# Have to run before cd
script_dir=$(cd $(dirname $0); pwd)
cd media
git_dir=_translation_repository/`echo "https://github.com/noyciy7037/kde-translate-demo.git" | cut -d ":" -f 2 | cut -d "/" -f 4-`
git_parent=`echo $git_dir | rev | cut -d "/" -f 2- | rev`
git_root=`echo $git_parent | cut -d "/" -f 1`
mkdir -p $git_parent
ln -s $script_dir $git_dir
mkdir projects

for file in $script_dir/ja/summit/messages/*
do
  project_name=`echo "${file}" | rev | cut -d "/" -f 1 | rev`
  ln -s `pwd`/$git_root projects/$project_name
done
