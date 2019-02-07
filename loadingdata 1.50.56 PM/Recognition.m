function [answer]=Recognition(img,net)                                      




%%PREPROCESSING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 

%I=imread(IImage); input read image
f1=feature_extractor(img);
f2=feature_extractor_2d(img);
I4=horzcat(f1',f2');




                                                                           %I1 will be used as an input to the network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TESTING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                 
%%%%%%%%%%%Taking inputs and targets
                  inputs=I4';                                               
          
                  answer= net(inputs);


end%%%%END OF PREPROCESSING AND TRAINING FOR AN IMAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%