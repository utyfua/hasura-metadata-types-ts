tag=$( \
    curl -sL https://api.github.com/repos/hasura/graphql-engine/releases/latest | \
    jq -r ".tag_name" | \
    sed 's/^.//' \
)
# save version in a file
echo $tag > VERSION
# replace version in package.json and save it
jq ".version = \"$tag\"" package.json > package.json.tmp && mv package.json.tmp package.json
