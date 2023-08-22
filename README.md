## A Simple NPZD Model

### Introduction
---
- A Fortran package to model the yearly cycles of nutrients, pythoplankton, zooplankton and detritus in a box-like system. The model was developed according to the descriptions and equations in "Introduction to the Modelling of Marine Ecosystems"[^1].
- The limiting nutrients is denoted as D, the bulk phytoplankton as P, the bulk zooplankton as Z and the bulk detritus as D.

&nbsp;

### Calculations
---
The following differential equations are solved for our model:

**Our Set of Differential Equations**

$$
\begin{flalign}
& \frac{d}{dt}N = -R(N,t)P + l_{PN}(P - P_{0}) + l_{ZN}(Z-Z_{0}) + l_{DN}D + A_{mix}(D-N) + S_{N}^{ext}  &
\end{flalign}
$$

$$
\begin{flalign}
& \frac{d}{dt}P = +R(N,t)P - G(P,t)Z - (l_{PN} + l_{PD})(P-P_{0})  &
\end{flalign}
$$

$$
\begin{flalign}
& \frac{d}{dt}Z = G(P,t)Z - (l_{ZD} + k_{ZN})(Z-Z_{0}) + l_{PD}(P-P_{0}) - l_{DN}D - A_{mix}(D-N) + S_{D}^{ext} &
\end{flalign}
$$

$$
\begin{flalign}
& \frac{d}{dt}D = l_{ZD}(Z-Z_{0})  &
\end{flalign}
$$

**with** 

$$
\begin{flalign}
& R(N,t) = {\theta}^{+} r_{max} f(N) = {\theta} ({\Delta} d - d_{0}) r_{max} \frac{N^{2}}{k_{N}^{2} + N^{2}}  &
\end{flalign}
$$

$$
\begin{flalign}
& G(P,t)= {\theta} ^{+} g_{max} g(P) = {\theta} ({\Delta}d -d_{0}) g_{max} (1 - e^{-I_{v} P^{2}})  &
\end{flalign}
$$

&nbsp;


### Variables
---
The following set of variables are used to solve the above equations. They can also be seen in `/input/parameter1.txt `
| Variables | Value | Description |
|--- |--- | --- |
| $lat $| 1.134464014 |  latitude|
|$h$|0.1|step in the euler function|
|$r_{max}$|1|maximum rate|
|$k_N$|0.1|half-saturation constant|
|$l_{PN}$|0.10|loss of P to N|
|$l_{PD}$|0.02|loss of P to D|
|$a_{mix}$|0.5|vertical mixing rate|
|$N_0$|0.99|initial value of N|
|$Z_0$|0.01|inital value of Z|
|$S_{N}^{ext}$|0|external sources and sinks of N|
|$g_{max}$|0.5|maximum grazing or ingestion rate|
|$I_v$|1.095445115|Ivlev parameter|
|$l_{ZN}$|0.01|loss of Z to N|
|$l_{ZD}$|0.02|loss of Z to D|
|$l_D$|0|loss of D by injections into the upper layer|
|$P_0$|0.01|initial value of P|
|$D_0$|0.99|initial value of D|
|$S_{D}^{ext}$|0|external sources and sinks of D|
|$l_{DN}$|0.001|loss of D to N|
|$threshday$|75|starting day for the production of pythoplankton|
|$end{\textunderscore}time$|365|number of days for which the cycle is plotted|


&nbsp;


### Code
---
To clone the repository, use:
```
git clone https://github.com/busetnrkl/npzd.git
```

In order to use the package, you can run the following commands in Linux:
- Go to the `~npzd/src` folder
- Run `make` to compile the code as `main` in  `~npzd/bin`
- Execute as `./main` in `~npzd/bin` 
- The output file will be saved as `data.txt` in `~npzd/output`
- Command `vi data.txt` in this folder to view the data
  
The commands will look as follows:
```
cd npzd/src
make clean
make
cd ..
cd bin
./main
cd ..
cd output
vi data.txt
```

&nbsp;

### Plotting
---
- You can plot the data in `data.txt` using the respective Python codes in the `postprocessing` folder. Using the parameters above, the following plot is obtained:

![plot](https://github.com/busetnrkl/npzd/assets/142319799/4be4a91e-3380-4a41-978b-bf60354cf247)



- The pythoplankton blooming occurs around day 75, following the sudden decrease in the nutrients.
- The increase in the pythoplankton causes a noticeable increase in zooplankton after day 140. This increase in zooplankton is followed by a continuous decrease in pythoplankton until the end of the year.
- The number of zooplankton increase until day 275, when the mixing of layers start to occur in winter. Here, the detritus is seen to mix with the nutrients, bringing the nutrient level closer to its initial value at the beginning of the year
- It should be noted that the cycle takes place in the Northern Hemisphere.

[^1]: Fennel, W., & Neumann, T. (2014). Introduction to the modelling of marine ecosystems. Elsevier.
