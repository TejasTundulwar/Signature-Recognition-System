% Function for training all data images given in the galary 
% Writer : Tejas.P.Tundulwar
% Created Sun Mar 29 20:29:58 IST 2015

function [net,tr,performance]=TrainingAll(Target)                                      

%setting file directory and assigning files sequence
file = dir('C:\Users\Tejas195\Desktop\Scansign2\*.png');
names = {file.name};
[a,b] = sort(names);
file = file(b);


%%%PREPROCESSING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
 
for count=1:numel(file)
I=imread(file(count).name);
f1=feature_extractor(I);
f2=feature_extractor_2d(I);


if count==1
I1=horzcat(f1',f2');
else
    I1(count,:)=horzcat(f1',f2');
end
end

                                                                                                                                   %I4 will be used as an input to the network
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%TRAINING%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                                 
%%%%%%%%%%%Taking inputs and targets
                  inputs=I1';                                              %selecting proper target matrix for image
                  [~,c]=ismember(file(count).name,a);                      %[~,c]=ismember(file(count).name,a);
                  targets=Target(c,:)';                                    % Target(c,:);  Target needs to be passed if needed as 
                                                                           %function takes present directory to be dataimages location
                                                                           %may need to pass address/path of the dataimages location too. 
 %%%%%%%%% Create a Pattern Recognition Network
          if(count==1)
          hiddenLayerSize = 10;
          net = patternnet(hiddenLayerSize);   
          end
          
 %%%%%%%%%% Train the Network
 
  net.trainFcn = 'trainscg';%Selecting training algorithm:scaled conjugate gradient
                            % For a list of all performance functions type
  net.performFcn = 'mse';  % Mean squared error
  
  %%training the network
  [net,tr] = train(net,inputs,targets);
  
  % Test the Network
outputs(count) = net(inputs);
errors(count) = gsubtract(targets,outputs);
performance(count) = perform(net,targets,outputs)
end
%%%%END OF PREPROCESSING AND TRAINING FOR AN IMAGE %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%