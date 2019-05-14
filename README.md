## spindle - mechanistic model of muscle spindle sensory function
### How to use: the basics
1. Script to run model
    - See 'example.m' for working example
    - Script should set up time, command length, and gamma inputs as time-series
        - Command lengths should be in units of nm (1 L0 = 1300 nm)
        - Gamma activations should be in normalized units, from 0-1
    - Command length and gamma inputs should be expressed as a delta, rather than actual value
    - Pass conditioned inputs into 'sarcSimDriver.m' to return half-sarcomere objects and sim data
    - _TIP:_ Call 'sarcSimDriver.m' within a [parfor](https://www.mathworks.com/help/parallel-computing/parfor.html) loop
    - Pass simulation data from driver into 'sarc2spindle.m' to return modeled muscle spindle firing rates

    
2. Simulation driver
    - *Would not recommend messing with this unless you want to be choosey about what data to store from sims*
    - 'sarcSimDriver.m' handles the sarcomere objects and data storage
    - Also handles different contextual simulation modes (slack mode vs. length control)

3. @halfSarcBag & @halfSarcChain
    - *Don't mess with this unless you want to fundamentally change the model*
    - Object definitions for bag and chain fibers, respectively
    - Based on [MyoSim](https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3933939/pdf/JGP_201311078.pdf), by Dr. Kenneth Campbell @ UK
    


### Published simulations

### Please cite the following (will be updated as publications become available)

Campbell, Kenneth S. "Dynamic coupling of regulated binding sites and cycling myosin heads in striated muscle." The Journal of general physiology 143, no. 3 (2014): 387-399

Blum, Kyle P., Boris Lamotte D’Incamps, Daniel Zytnicki, and Lena H. Ting. "Force encoding in muscle spindles during stretch of passive muscle." PLoS computational biology 13, no. 9 (2017): e1005767.
Harvard	

Blum, Kyle P., Paul Nardelli, Timothy C. Cope, and Lena H. Ting. "Noncontractile tissue forces mask muscle fiber forces underlying muscle spindle Ia afferent firing rates in stretch of relaxed rat muscle." bioRxiv (2018): 470302.





