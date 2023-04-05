# clone target and ignore errors if it already exists
git clone --depth 1 --branch $TARGET_BRANCH https://github.com/hasura/graphql-engine/

# recreate output directory and ignore errors if it already exists
rm -rf dist || true
rm -rf output || true
mkdir -p output/features
mkdir -p output/components/Common/utils

# copy the files to output directory
cp -rip  graphql-engine/frontend/libs/console/legacy-ce/src/lib/features/hasura-metadata-types output/features/hasura-metadata-types
cp -rip  graphql-engine/frontend/libs/console/legacy-ce/src/lib/components/Common/utils/tsUtils.ts output/components/Common/utils
cp dataSources.ts output/
find ./output/ -name "*.test.ts" -exec rm -rf {} \;

npx tsc
