#! /usr/bin/env bash
# Generate rcfiles compatible for old nano versions
# Author: rasa (https://github.com/rasa)
# Revised: davidhcefx (https://github.com/davidhcefx)

set -eu
cd "$(dirname "$0")/../"

# use gsed if installed
if command -v brew &>/dev/null; then
    PATH="$(brew --prefix)/opt/gnu-sed/libexec/gnubin:${PATH}"
fi
# bash version >= 4.0 for Assoc array and mapfile support
if [ "${BASH_VERSINFO[0]}" -lt 4 ]; then
    echo "Error: Bash version >= 4.0 is required."
    exit 1
fi

# NOTE: remember to also sync with install.sh
declare -A branches=(
    [pre-6.0]=pre-6.0
    [pre-5.0]=pre-5.0
    [pre-4.5]=pre-4.5
    [pre-2.9.5]=pre-2.9.5
    [pre-2.6.0]=pre-2.6.0
    [pre-2.3.3]=pre-2.3.3
    [pre-2.1.6]=pre-2.1.6
)

function color_replace() {
    local from="$1"
    local to="$2"
    # color <fg>,<bg>
    sed -E -i -e "s/(color\\s+)$from\b/\\1$to/" \
            -e "s/(color\\s+[a-z]*,\\s*)$from\b/\\1$to/" "${nanos[@]}"
}


# ensures current branch is master
git checkout master

# pulls all new commits made to upstream/master
# git pull upstream master

# ensure there are no changes to commit
if [ -n "$(git status --porcelain 2>/dev/null | tail -n 1)" ]; then
    echo "Error: There are changes to commit."
    exit 1
fi

# remove existing pre branches
for b in "${branches[@]}"; do
    git branch -D "${b}" || true
done

# ignore symlinks, because sed will convert them to regular files
mapfile -t nanos <<<"$(find . -not -type l -name '*.nanorc' | sort)"

################################
git checkout -b "${branches[pre-6.0]}"

color_replace "rosy"  "pink"
color_replace "beet"  "purple"
color_replace "plum"  "mauve"
color_replace "sea"   "lagoon"
color_replace "sky"   "lagoon"
color_replace "slate" "mint"
color_replace "teal"  "mint"
color_replace "sage"  "lime"
color_replace "brown" "lime"
color_replace "ocher" "lime"
color_replace "sand"  "lime"
color_replace "tawny" "latte"
color_replace "brick" "orange"
color_replace "crimson" "red"
git commit -am "fix: pre-6.0: Replace color: rosy, beet, plum, sea, sky, slate, teal, sage, brown, ocher, sand, tawny, brick, crimson" || true

color_replace "grey" "lightblack"
color_replace "gray" "lightblack"
git commit -am "fix: pre-5.8: Replace {grey,gray} => 'lightblack'" || true

################################
git checkout -b "${branches[pre-5.0]}"

color_replace "pink"   "brightred"
color_replace "purple" "magenta"
color_replace "mauve"  "magenta"
color_replace "lagoon" "cyan"
color_replace "mint"   "green"
color_replace "lime"   "green"
color_replace "peach"  "yellow"
color_replace "orange" "yellow"
color_replace "latte"  "yellow"
git commit -am "fix: pre-5.0: Replace color: pink, purple, mauve, lagoon, mint, lime, peach, orange, latte" || true

sed -E -i -e 's/(color\s+)light([a-z]+)/\1bright\2/' \
        -e 's/(color\s+[a-z]*,\s*)light([a-z]+)/\1bright\2/' "${nanos[@]}"
git commit -am "fix: pre-5.0: Replace prefix 'light*' => 'bright*'" || true

sed -E -i -e 's/(color\s+[a-z]*,\s*)bright([a-z]+)/\1\2/' "${nanos[@]}"
git commit -am "fix: pre-5.0: Remove background prefix 'bright*'" || true

sed -E -i -e 's/(color\s+)(bold|italic),/\1/' "${nanos[@]}"
git commit -am "fix: pre-5.0: Remove 'bold' and 'italic' specifier" || true

################################
git checkout -b "${branches[pre-4.5]}"
sed -E -i -e 's/^\s*tabgives\b/# \&/' "${nanos[@]}"
git commit -am "fix: pre-4.5: Comment out 'tabgives'" || true

# somewhere before 4.5
# +++ b/Rnw.nanorc
# -color blue "([a-zA-Z0-9_\-$\.]*)\("
# +color blue "([a-zA-Z0-9_$\.-]*)\("
sed -E -i -e 's/a-zA-Z0-9_\\-\$\\\./a-zA-Z0-9_$\\.-/' "${nanos[@]}"

# +++ b/jade.nanorc
# +++ b/pug.nanorc
# -icolor brightgreen "https?:\/\/(www\.)?[a-zA-Z0-9@%._\+~#=]{2,256}\.[a-z]{2,6}\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)" "_blank"
# +icolor brightgreen "https?:\/\/(www\.)?[a-zA-Z0-9@%._\+~#=]+\.[a-z]+\b([-a-zA-Z0-9@:%_\+.~#?&//=]*)" "_blank"
sed -E -i -e 's/]\{2,256\}\\/]+\\/' "${nanos[@]}"
sed -E -i -e 's/]\{2,6\}\\b/]+\\b/' "${nanos[@]}"

# +++ b/toml.nanorc
# -color ,red "^[[:space:]]*\[\..*?\]"
# +color ,red "^[[:space:]]*\[\..*"
sed -E -i -e 's/(color ,red .*\.\.\*)\?\\]/\1/' "${nanos[@]}"

# +++ b/x11basic.nanorc
# -icolor brightwhite "\<[A-Z_][A-Za-z0-9_]*(|\$|\%|\&|\||\(\))\>"
# +icolor brightwhite "\<[A-Z_][A-Za-z0-9_]*(\$|\%|\&|\||\(\))\>"
sed -E -i -e 's/(icolor\s+brightwhite.*\*\()\|/\1/' "${nanos[@]}"

# +++ b/yaml.nanorc
# -color red "(^|\s+).*+\s*:(\s|$)"
# +color red "(^|\s+).*\+\s*:(\s|$)"
sed -E -i -e 's/(color\s+red\s+.*\)\.\*)\+/\1\\+/' "${nanos[@]}"
git commit -am "fix: pre-4.?: Fix bad regexes" || true

################################
git checkout -b "${branches[pre-2.9.5]}"
color_replace "normal" "white"
git commit -am "fix: pre-2.9.5: Replace 'normal' => 'white'" || true

color_replace "brightnormal" "brightwhite"
git commit -am "fix: pre-2.9.5: Replace 'brightnormal' => 'brightwhite'" || true

sed -E -i -e 's/^(\s*syntax\s+)([^"[:space:]]+)(\s.*)/\1"\2"\3/' "${nanos[@]}"
git commit -am "fix: pre-2.9.4: Add quotes around syntax names" || true

################################
git checkout -b "${branches[pre-2.6.0]}"
sed -E -i -e 's/^\s*comment\b/# \&/' "${nanos[@]}"
git commit -am "fix: pre-2.6.0: Comment out 'comment'" || true

################################
git checkout -b "${branches[pre-2.3.3]}"
sed -E -i -e 's/^\s*linter\b/# \&/' "${nanos[@]}"
git commit -am "fix: pre-2.3.3: Comment out 'linter'" || true

sed -E -i -e 's/^\s*magic\b/# \&/' "${nanos[@]}"
git commit -am "fix: pre-2.3.0: Comment out 'magic'" || true

################################
git checkout -b "${branches[pre-2.1.6]}"
sed -E -i -e 's/^\s*header\b/# \&/' "${nanos[@]}"
git commit -am "fix: pre-2.1.6: Comment out 'header'" || true

# sed -E -i -e 's/^(\s*icolor\s+cyan\s+.*Add-AppPackage)/# \1/' "${nanos[@]}"
# git commit -am "fix: pre-2.1.6: Comment out long string causing out-of-memory" || true

################################

# git checkout master
# take care, this will delete all your changes on your forked master
# git push --force origin master

echo ""
echo "Please confirm to force push the following branches:"
for b in "${branches[@]}"; do
    echo "- ${b}"
done
read -rp "Confirm? [y/N] " ch
if [ "$ch" != "y" ]; then
    echo "Aborted."
    exit 1
fi

for b in "${branches[@]}"; do
    git checkout "${b}"
    git push --force -u origin "${b}"
done

git checkout master
