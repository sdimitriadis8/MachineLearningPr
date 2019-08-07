load abalone_dataset
X=abaloneInputs;
target = zeros(10,size(abaloneTargets,2));

for i = 1:size(abaloneTargets,2)
   j = abaloneTargets(i)+1;
    target(j,i) = 1;
end

% Create a Pattern Recognition Network
hiddenLayerSize = 30;
net = patternnet(hiddenLayerSize);


% Set up Division of Data for Training, Validation, Testing
net.divideParam.trainRatio = 70/100;
net.divideParam.valRatio = 20/100;
net.divideParam.testRatio = 10/100;


% Train the Network
[net,tr] = train(net,X,target);

% Test the Network
outputs = net(X);
errors = gsubtract(target,outputs);
performance = perform(net,target,outputs)

% View the Network
view(net)