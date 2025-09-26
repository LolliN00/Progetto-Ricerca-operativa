# CDF Approximation Project

An Operations Research project that approximates cumulative distribution functions (CDFs) using piecewise constant functions with minimal deviation.

## Problem Description

This project solves the problem of approximating a given cumulative distribution function with a piecewise constant function that:
- Uses exactly `n` steps
- Maintains monotonicity (non-decreasing property)
- Minimizes the total absolute deviation from the original CDF

## Mathematical Model

The optimization model is formulated as a Mixed Integer Linear Program (MILP) with:
- **Decision variables**:
  - `G[i]`: Approximated CDF values
  - `z[i]`: Binary variables indicating step locations
  - `t[i]`: Absolute deviation variables
- **Constraints**: Monotonicity, step count, boundary conditions
- **Objective**: Minimize sum of absolute deviations

## Files Structure

```
├── src/
│   ├── model.mod       # AMPL optimization model
│   └── data.dat        # Input data (CDF values and parameters)
├── docs/
│   └── report.pdf      # Project documentation and results
├── results/            # Output files and solutions
└── README.md          # This file
```

## Usage

To solve the optimization problem:

1. **Using AMPL**:
   ```
   ampl: model src/model.mod;
   ampl: data src/data.dat;
   ampl: solve;
   ```

2. **Using GLPK** (if available):
   ```
   glpsol --model src/model.mod --data src/data.dat
   ```

## Requirements

- AMPL modeling language
- Compatible solver (CPLEX, Gurobi, GLPK, etc.)

## Parameters

- `n`: Number of steps in the approximation (default: 4)
- `N`: Number of data points (default: 10)
- `F[i]`: Original CDF values at each point

## Output

The solution provides:
- Optimal approximated CDF values `G[i]`
- Step locations indicated by `z[i]`
- Minimum total deviation achieved

## Author

Lorenzo Nobili - University of Parma
