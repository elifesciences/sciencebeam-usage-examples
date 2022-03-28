# ScienceBeam Usage Examples

## ⚠️ Under new stewardship

eLife have handed over stewardship of ScienceBeam to The Coko Foundation. You can now find the updated code repository at https://gitlab.coko.foundation/sciencebeam/sciencebeam-usage-examples and continue the conversation on Coko's Mattermost chat server: https://mattermost.coko.foundation/

For more information on why we're doing this read our latest update on our new technology direction: https://elifesciences.org/inside-elife/daf1b699/elife-latest-announcing-a-new-technology-direction

## Overview

[![Binder](https://mybinder.org/badge_logo.svg)](https://mybinder.org/v2/gh/elifesciences/sciencebeam-usage-examples/HEAD?urlpath=lab)

This repo provides usage examples for ScienceBeam.
In particular [ScienceBeam Parser](https://github.com/elifesciences/sciencebeam-parser).
The examples are provided as [Jupyter notebooks](notebooks).

## Notebooks

- [ScienceBeam Parser: Start Service using Python API and use Rest API](notebooks/sciencebeam-parser/sciencebeam-parser-service.ipynb) ([open in colab](https://colab.research.google.com/github/elifesciences/sciencebeam-usage-examples/blob/develop/notebooks/sciencebeam-parser/sciencebeam-parser-service.ipynb))
- [ScienceBeam Parser: Use Python API to parse PDF to TEI XML](notebooks/sciencebeam-parser/sciencebeam-parser-library.ipynb) ([open in colab](https://colab.research.google.com/github/elifesciences/sciencebeam-usage-examples/blob/develop/notebooks/sciencebeam-parser/sciencebeam-parser-library.ipynb))
- [ScienceBeam Parser: Advanced example exploring and training `name` model](notebooks/sciencebeam-parser/sciencebeam-parser-advanced-name-model.ipynb) ([open in colab](https://colab.research.google.com/github/elifesciences/sciencebeam-usage-examples/blob/develop/notebooks/sciencebeam-parser/sciencebeam-parser-advanced-name-model.ipynb))

[Launch notebooks in binder](https://mybinder.org/v2/gh/elifesciences/sciencebeam-usage-examples/HEAD?urlpath=lab)

## Running the notebooks locally

This requires Docker and Docker Compose.

```bash
make jupyter-build jupyter-start jupyter-logs
```

The service will be available under the [port 8890](http://localhost:8890/),
unless another port has been configured using `SCIENCEBEAM_USAGE_EXAMPLES_JUPYTER_PORT` (see [.env](.env)).

```bash
make jupyter-stop
```
