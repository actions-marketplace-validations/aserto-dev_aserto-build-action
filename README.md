# aserto-build-action

## Aserto Build 

GitHub action for building policy bundles


## Inputs

### `source_path`

**Required** The directory path to the input source to build. 

Default: `src`

### `target_path`

**Required** The directory path to the build output. 

Default: `build`

### `target_file`

**Required** The build output filename. 

Default: `bundle.tar.gz`

### `revision`

Revision tag (GitHub SHA)

No default value

### `build_options`

Optional build options like --debug --optimize etc. 

No default value

### `verbose`

Verbose logging of execution of action [true | false]. 

Default: `false`


## Outputs

None defined


## Example

```
name: build-release

on:
  workflow_dispatch:
  push:
    tags:
    - '*'

jobs:
  release_policy:
    runs-on: ubuntu-latest
    name: build
    steps:
    
    - uses: actions/checkout@v2

    - name: Build Policy 
      id: aserto-build
      uses: aserto-dev/aserto-build-action@v2
      with:
        source_path: src
        target_path: build
        target_file: bundle.tar.gz
        revision: "$GITHUB_SHA"
        verbose: true

    - name: Release Policy
      id: release
      uses: xresloader/upload-to-github-release@master
      env:
        GITHUB_TOKEN: ${{ secrets.GITHUB_TOKEN }}
      with:
        file: "build/bundle.tar.gz"
        tags: true
        draft: false
        verbose: true

    - name: Push Policy 
      id: aserto-push
      uses: aserto-dev/aserto-push-action@v2
      env:
        ASERTO_PUSH_KEY: ${{ secrets.ASERTO_PUSH_KEY }}
      with:
        bundle: build/bundle.tar.gz
        release_id: ${{ steps.release.outputs.release_id }}
        verbose: true
```