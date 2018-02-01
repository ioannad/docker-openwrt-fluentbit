# Fluent-bit docker image over OpenWRT

This docker image is based on mcreations/openwrt-x64:latest. 

## Installation

To install, `make && make clean`.

## Usage

### Built-in config files

You may start Fluent-bit with one of the built-in configs, found in `src/fluent-bit/conf/`, or make your own config file, say <FOO.conf>, which should be placed in `/mnt`. This can also be a combination of built-in configs, with or without own extra rules, as specified [here](http://fluentbit.io/documentation/0.12/configuration/file.html#config_include_file).

```
docker run -e FLUENTBIT_CONFIG_FILE=<FOO.conf> docker-openwrt-fluentbit 
```

## Updating

To update to a version with tag $TAG, do:


```
git subtree pull -P src/fluent-bit --squash https://github.com/fluent/fluent-bit.git $TAG
make && make clean
```



