# ScienceBeam Usage Examples

This repo provides usage examples for ScienceBeam.
In particular [ScienceBeam Parser](https://github.com/elifesciences/sciencebeam-parser).
The examples are provided as [Jupyter notebooks](notebooks).

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
