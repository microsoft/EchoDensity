# Echo density measure
These scripts and data illustrate the "Sorted Center Time" measure for temporal echo density in impulse response signals that was proposed in the paper: 

[**A Sparsity Measure for Echo Density Growth in General Environments,**](https://www.microsoft.com/en-us/research/uploads/prod/2019/04/A_sparsity_measure_for_echo_density_growth_in_general_environments8.pdf)<br/> Helena Peic Tukuljac, Ville Pulkki, Hannes Gamper, Keith Godin, Ivan Tashev, Nikunj Raghuvanshi,<br/>*IEEE International Conference on Acoustics, Speech, and Signal Processing (ICASSP), May 2019*

## Contents
| File/folder       | Description                         |
|-------------------|-------------------------------------|
| `Figs_1_2.m` | Generates Figures 1 and 2 from the paper, demonstrating step-by-step application of the complete algorithm to a shoebox impulse response. |
| `Fig_6.m` | Generates Figure 6 in paper, illustrating changes in echo density by computing echo density curves on IRs for a series of shoeboxes with ceiling progressively slid open, and fitting the temporal echo density model proposed in the paper, implemented in the function `curve_fitting()`. |
| `core/` | Main signal processing algorithms |
| `data/` | Synthetic impulse response data usable with the scripts |
| `README.md`       | This README file. |
| `CONTRIBUTING.md` | Guidelines for contributing to the sample. |

## Prerequisites

Matlab scripts were tested on R2018a

## Notes
- The algorithms here compute the echo density as an *unnormalized* percentage value that is 0 for a Dirac delta and 50 for a constant signal. 
- Divide with the value obtained from `gaussian_measure()` to turn sorted-center-time into an echo density that is 1 for Gaussian noise.

## Citing
If you employ the data or algorithms, please cite using Bibtex key below.

```
@inproceedings{Tukuljac_EchoDensity:2019,
author={H. P. {Tukuljac} and V. {Pulkki} and H. {Gamper} and K. {Godin} and I. J. {Tashev} and N. {Raghuvanshi}},
booktitle={ICASSP 2019 - IEEE International Conference on Acoustics, Speech and Signal Processing},
title={A Sparsity Measure for Echo Density Growth in General Environments},
month={May},
year={2019},
volume={},
number={},
pages={},
doi={10.1109/ICASSP.2019.8682878},
ISSN={1520-6149},
keywords={acoustic analysis;architectural acoustics;echo;geometry;numerical analysis;statistical analysis;transient response;detailed temporal evolution;acoustic analysis;general environments;smooth sorted density measure;echo density growth;general power-law model;measured simulated impulse responses;numerically simulated impulse responses;growth power;sparsity measure;simple room geometries;complex scenes;statistical parameter;indoor response;outdoor response;Density measurement;Acoustic measurements;Microsoft Windows;Reverberation;Market research;Geometry;impulse response;echo density;mixing time;outdoor acoustics;parametric models;statistical signal processing},
}
```

## License
Code is released under MIT License, consult LICENSE file in root folder.

The data is released under the [Open Use of Data Agreement](https://github.com/microsoft/Open-Use-of-Data-Agreement/blob/master/O-UDA-1.0.md).

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
