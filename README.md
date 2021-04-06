# aserto-build-action

## Aserto build policy pack action


## Inputs

### `source_path`

**Required** The directory path to the input source to build. 

Default `"src"`

### `target_path`

**Required** The directory path to the build output. 

Default `"build"`

### `target_file`

**Required** The file path to the build output. 

Default `"bundle.tar.gz"`

### `build_options`

Optional build options like --debug --optimize etc. 

Default `"--revision $GITHUB_SHA"`

### `verbose`

Verbose logging of execution of action [true | false]. 

Default `false`

## Outputs

None defined
