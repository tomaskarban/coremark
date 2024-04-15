# CoreMark as a Docker Container

CoreMark is a tiny executable that is compiled with the number of threads/forks
to run in parallel to benchmark multicore CPUs. It is unfortunate that it is not
a parameter that you could pass to a compiled executable.

That means it is not entirely straightforward to create a Docker container that would
detect the number of cores available and just run the CoreMark binary that was built
into the container. Instead, we need to build the binary after launching the container.

## Container Contents

The container is based on the latest alpine -- the famous tiny distro. We only
add one small script `coremark.sh` that gets executed when the container starts.

## Execution

The script executes the following steps:
 - updates the package manager apk,
 - upgrades all existing packages,
 - installs GCC and git,
 - clones the CoreMark source code from https://github.com/eembc/coremark.git,
 - detects the number of cores using `nproc`,
 - builds and executes CoreMark,
 - tails the benchmark result.

When the script ends, the container is stopped.

## Building and Running the Container

Simple and straightforward:

```
docker build -t coremark .
docker run coremark
```

## Benchmark Results

The end of the output looks like this:

```
------------------------------------------------------
Correct operation validated. See README.md for run and reporting rules.
CoreMark 1.0 : 138206.388206 / GCC13.2.1 20231014 -O2 -DMULTITHREAD=6 -DUSE_FORK -DPERFORMANCE_RUN=1  -lrt / Heap / 6:Fork
```

It shows the CoreMark self-test was successful. Then it shows the benchmark result
of `138206` points, followed by extra information about the compiler and its options.
In the example above, the GCC version was 13.2.1, and the benchmark was compiled for 6 cores.
