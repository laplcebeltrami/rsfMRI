%The script load the subset of processed rs-fMRI data used in study
%Huang, S.-G., Samdin, S.B., Ting, C.M., Ombao, H., Chung, M.K. 
%2020 Statistical model for dynamically-changing correlation matrices 
%with application to brain connectivity. Journal of Neuroscience 
%Methods 331:108480
%
% The data went through the minimal preprocssing related to head motions:
% FD based motion correction, scrubing and imputation. 
% Also the data is centered to the mean since every 
% subject has different amount of brain activation. 
% Other image processing such as bandpass filtering and basis expansion 
% are not applied. 
%
%http://pages.stat.wisc.edu/~mchung/papers/huang.2020.NM.pdf
%
%Do not distribute the data or upload to other sites. 
%This is not public domain or copyright free data. 
%% If you are using the data for publication, please reference the paper above.
%
%
% (C) 2021- Moo K. Chung  mkchung@wisc.edu
%     University of Wisconsin-Madison
%     
% Created 2021 Jun 07
% Edited  2021 Dec 20
% Edited  2022 Oct 2
%

%% The neuroscienfific question worth persuing is if rs-fMRI data is 
%% showing different patterns between different regions of brains. 
%% The following regions of the brain is carefully picked. 
%
% You should be able to answer the following questions. 
%
%% 1) Is there topological changes over time?
%% 2) Is brain function topologically stable?
%% 3) is the topological pattern repeating (periodic) or random?
%
%% Optional more neuroscience specific questions. 
%% 4) Are rs-fMRI symmetric btween left and right hemesphere?
%% 5) Are rs-fMRI pattern different in 3 different regions of the brain.
%
% 15 F3OG Left orbital part of interior frontal gyrus
% 16 F3OD Right orbital part of intferior frontal gyrus
% 37 HIPPOG Left hipocampus
% 38 HIPPOD Right hippocampus
% 51 O2G Left middle occipital 
% 52 O2D Right middle occipital

%ind=[15 16 37 38 51 52];
%rsfMRI = avgfMRI(:,ind,1:100);
%save rsfMRI.mat rsfMRI 

%Variable rsfMRI is of size 1200 x 6 x 100.
%There are 1200 time points, 6 brain regions (indexed exactly as above)
%for 100 subjects. 

load rsfMRI.mat

%Display rs-fMRI of the first subject. 
figure; plot(rsfMRI(:,1,1), 'k'); 
hold on; plot(rsfMRI(:,2,1), 'r')
legend('Left interior frontal gyrus', 'Right interior frontal gyrus')
%We can see a fair bit of symmetric and syncronization pattern.

%The first few time points are considered as outliers and can be removed. 
%The start of scanning that cause various noise. However, the last time
%points are not outliers. 
%The occipital regions (visual area) are highly fluctuating since people 
%usually think visually even when they close eyes inside the scannter. 

%Do not avarge all 100 subjects and display. This is total nonsense.
% Registering and matching across hemisphere is reasonable but that is 
% absurdity if we try to do that across subjects. Brain functions don't 
% synchronize across subjects. What should have been done is doing 
% Fourier expansion. Then average within specific frequency or bandpass.
% That will match across subjects.  

avgfMRI = mean(rsfMRI,3);
figure; plot(avgfMRI(:,1), 'k')
hold on; plot(avgfMRI(:,2), 'r')
legend('Left interior frontal gyrus', 'Right interior frontal gyrus')



















