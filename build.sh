TARGET_BRANCH=$(cat VERSION)

rm -rf graphql-engine || true
# clone target
git clone --depth 1 -b v$TARGET_BRANCH https://github.com/hasura/graphql-engine/

# recreate output directory and ignore errors if it already exists
rm -rf dist || true
rm -rf output || true
mkdir -p output/features
mkdir -p output/metadata
mkdir -p output/components/Common/utils
mkdir -p output/components/Services/Data/TablePermissions/InputValidation

# copy the files to output directory
cp -rip graphql-engine/frontend/libs/console/legacy-ce/src/lib/features/hasura-metadata-types output/features/hasura-metadata-types
cp -rip graphql-engine/frontend/libs/console/legacy-ce/src/lib/components/Common/utils/tsUtils.ts output/components/Common/utils
cp mocks/dataSources.ts output/dataSources.ts
cp mocks/InputValidation.ts output/components/Services/Data/TablePermissions/InputValidation/InputValidation.ts
cp mocks/types.ts output/metadata/types.ts
find ./output/ -name "*.test.ts" -exec rm -rf {} \;

npx tsc
