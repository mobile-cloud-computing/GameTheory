## PDToolbox - MATLAB 2014 R2


PDToolbox is a matlab implementation of some evolutionary dynamics from game theory. The current version supports the implementation of replicator dynamics, Maynard Smith's replicator dynamics, Smith dynamics, logit dynamics, and Brown-von Neumann-Nash dynamics. Also, it can be used to run revision protocols, that is, population games with small number of agents per population. 

This toolbox is designed to facilitate the implementation of any game, regardless of the number of populations, strategies per population, and fitness function. It has some pre-build methods to implement different dynamics, revision protocols, and to plot the evolution of the state of each population. This software is distributed under BSD license.


## Running the Game Theory Optimization

In order to use the toolbox we must define the parameters of the game in a data structure. Some parameters that must be defined are: 

	* Number of populations, 
	* Strategies of each population
	* Evolutionary dynamics
	* ODE solver
	* Fitness function


The following examples are included in the 'test' directory:

	'GameCoalition.m': the main implementation of our game using PDTOOLBOX

	'MyFitness.m': The main fitness function that is used for the optimization.
 	There are some files for calculation of distance / angular similarities and also saving CSV file for machine learning.  Link to an example of traces : https://github.com/mehrdadasadiut/GameSolutions-Data

	Other test / fitness files are from PDTOOL BOX for learning purposes.
	


## Documentation

An introduction to evolutionary dynamics with some examples is available at:

	https://github.com/carlobar/PDToolbox_matlab/blob/master/docs/documentation.pdf



## License


PDToolbox is released under the [BSD License](http://opensource.org/licenses/BSD-3-Clause)

