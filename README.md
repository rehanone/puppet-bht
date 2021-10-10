# rehan-bht

[![Build Status](https://travis-ci.com/rehanone/puppet-bht.svg?branch=master)](https://travis-ci.com/rehanone/puppet-bht)

#### Table of Contents
1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
4. [Usage](#usage)
    * [Classes](#classes)
    * [Referances](#referances)
5. [Dependencies](#dependencies)
6. [Development](#development)

## Overview
The `rehan-bht` installs & manages `bht` a tool for testing Hard Disks.

## Module Description
A puppet module for managing the installation of `bht`.

More information on `bht` tool can be found at:

  - [https://github.com/ezonakiusagi/bht](https://github.com/ezonakiusagi/bht)

## Setup
In order to install `rehan-bht`, run the following command:
```bash
$ puppet module install rehan-bht
```
The module does expect all the data to be provided through 'Hiera'. See [Usage](#usage) for examples on how to configure it.

#### Requirements
This module is designed to be as clean and compliant with latest puppet code guidelines.

## Usage

### Classes

#### `bht`

A basic install with the defaults would be:
```puppet
include bht
```

## Dependencies

* [stdlib][1]
* [vcsrepo][2]

[1]:https://forge.puppet.com/puppetlabs/stdlib
[2]:https://forge.puppet.com/puppetlabs/vcsrepo

## Development

You can submit pull requests and create issues through the official page of this module: https://github.com/rehan/puppet-bht.
Please do report any bug and suggest new features/improvements.
