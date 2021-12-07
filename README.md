# Anomaly Detection for CPS With Multiplicative Noise Uncertainty
This repository contains the MATLAB code to simulate the anomaly detector design for a linear time varying system whose dynamics has both multiplicative and additive noises.

# Dependencies
- MATLAB (Preferrably 2019b or higher)
- SOS ToolBox (Strongly recommended to download the latest version from Caltech website)
- SeDuMi solver

# Procedure to Run the Code
Please run the file named `multi_noise_lcss.mlx` after including the required toolboxes and solvers in the Matlab path.

### Step 1.  
The variances of the multiplicative noises can be set through lines `240-244` in the `multi_noise_lcss.mlx` file.
### Step 2. 
Run the file `multi_noise_lcss.mlx`. Once the simulations are done, the code will automatically generate the workspace data file named as `data00var.mat`
### Step 3
Run the file named `multi_noise_lcss_comparison_plotter.m` after correctly importing the data file in line `#1`. This will generate the required plot. Adjust the zoomed-in histograms based on the obtained results.


# Contributors
- Venkatraman Renganathan (Lund University, University of Texas at Dallas)
- Benjamin Gravell (University of Texas at Dallas)
- Justin Ruths (University of Texas at Dallas)
- Tyler Summers (University of Texas at Dallas)

# Contact Details
For any information and queries, please contact me at my email venkat@control.lth.se
