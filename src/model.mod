# AMPL Model for CDF Approximation Problem
# Approximates a cumulative distribution function with piecewise constant function

# PARAMETERS
param n >= 1;                    # Number of steps in approximation
param N >= 1;                    # Number of data points
set Nset := 1..N;               # Index set for data points
param F{Nset} >= 0, <= 1;       # Original CDF values

# VARIABLES
var G{Nset} >= 0, <= 1;         # Approximated CDF values
var t{Nset} >= 0;               # Absolute deviation variables
var z{i in Nset} binary;        # Binary variables for step selection

# CONSTRAINTS
# Monotonicity: approximated CDF must be non-decreasing
subject to monotonicity {i in Nset: i > 1}:
    G[i] >= G[i-1];

# Number of steps constraint
subject to step_count:
    sum{i in Nset} z[i] = n - 1;

# Step increment constraint
subject to step_increment {i in Nset: i > 1}:
    G[i] <= G[i-1] + z[i];

# Boundary condition: CDF ends at 1
subject to boundary:
    G[N] = 1;

# Absolute deviation constraints (linearization of |F[i] - G[i]|)
subject to deviation_positive {i in Nset}:
    t[i] >= F[i] - G[i];

subject to deviation_negative {i in Nset}:
    t[i] >= G[i] - F[i];

# OBJECTIVE
# Minimize total absolute deviation
minimize total_deviation:
    sum{i in Nset} t[i];   
