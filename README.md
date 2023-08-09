## rsfMRI time series data

The script loads the subset of processed rs-fMRI data used in study

Huang, S.-G., Samdin, S.B., Ting, C.M., Ombao, H., Chung, M.K. 
2020 Statistical model for dynamically-changing correlation matrices 
with application to brain connectivity. Journal of Neuroscience Methods 331:108480
http://pages.stat.wisc.edu/~mchung/papers/huang.2020.NM.pdf

The data went through the minimal preprocssing related to head motions:
FD based motion correction, scrubing and imputation. Also the data is centered to the mean since every 
subject has different baseline of brain activation. Other image processing such as bandpass filtering and basis expansion are not applied. 
If you are using the data for publication, please reference the paper above and github site.

(C) 2021- Moo K. Chung  mkchung@wisc.edu
University of Wisconsin-Madison     
