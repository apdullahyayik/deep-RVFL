function y=dRVFLtest(input,net)
% dRVFLtest: Deep Random Vector Functional Link testing function
%
%Output Parameters
%         y: actul output
%
%Input Parameters
%         net: structure that includes network parameters.
%         structure, numberofhiddenlayer, hiddenlayerweights,
%         hiddenlayerout, D, outputlayerweights
%
% Example Usage
%         input=rand(3,5);
%         target=rand(3,1);
%         net=dRVFLtrain(input, target, [5,5,5])
%         y=dRVFLtest(input, net)
%        % check target and y values
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% %                           TEST                               %
% %            Deep Random Vector Functional Link                %
% %                                                              %
% %                  Apdullah Yayik, 2019                        %
% %                  apdullahyayik@gmail.com                     %
% %                                                              %
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

hiddenlayeroutstest{1,1}=input;
Dtest=hiddenlayeroutstest{1,1};
numberofhiddenlayer=size(net.hiddenlayerweights, 2)+1;
for p=1:numberofhiddenlayer-1
    hiddenlayeroutstest{1,p+1}=logsig(hiddenlayeroutstest{1,p}*net.hiddenlayerweights{1,p});
    Dtest=[Dtest, hiddenlayeroutstest{1,p+1}];
end
y=Dtest*net.outputlayerweights;
end