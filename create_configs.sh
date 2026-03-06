for file in ja/summit/messages/*
do
  project_name=`echo "${file}" | rev | cut -d "/" -f 1 | rev`
  cat <<EOS > configs/$project_name.toml
basepath = "../"

locales = [
    "ja"
]

[[paths]]
    reference = "templates/summit/messages/$project_name/*.pot"
    l10n = "{locale}/summit/messages/$project_name/*.po"

EOS

done
