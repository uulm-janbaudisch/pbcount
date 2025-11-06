# PBCount

Research source code release for pseudo boolean counter for our papers: 
  
*Engineering an Exact Pseudo-Boolean Model Counter* (AAAI2024)
  
*Towards Projected and Incremental Pseudo-Boolean Model Counting* (AAAI2025)

## Dependencies

### Required

- [Boost 1.82](https://boost.org)

### Bundled as Submodules

- [cudd](https://github.com/cuddorg/cudd)
- [cxxopts](https://github.com/jarro2783/cxxopts)

## Build

Make sure CMake and Boost are installed on the system.
Please build with gcc 10 and above for linux and clang for macOS.

Configure the build using CMake:

```
cmake -B build
```

Build the project:

```
cmake --build build
```

The resulting binary will be found at `build/pbcount`

## Usage

Example pb formula file (`.opb` files) can be found in the `examples` folder.

Call pbcount on the examples as follow

```
./pbcount --wf 1 --cf examples/example1.opb
./pbcount --wf 1 --cf examples/example2.opb
./pbcount --wf 2 --cf examples/example3.opb
```

For more detailed usage and parameters, see `./pbcount -h`.
