load digits;
X = learn.P';
Y = learn.T';
autoenc = trainAutoencoder(X,40,'MaxEpochs',50,'DecoderTransferFunction','purelin');
feat1 = encode(autoenc,X);

hiddenSize2 = 20;
autoenc2 = trainAutoencoder(feat1,40,'MaxEpochs',50,'DecoderTransferFunction','purelin');
feat2 = encode(autoenc2,feat1);

hiddenSize3 = 10;
autoenc3 = trainAutoencoder(feat2,40,'MaxEpochs',50,'DecoderTransferFunction','purelin');
feat3 = encode(autoenc3,feat2);

softnet = trainSoftmaxLayer(feat3,Y,'MaxEpochs',20);


deepnet = stack(autoenc1,autoenc2,autoenc3,softnet);

xReconstructed = predict(autoenc3,test.P');

figure;
plot(test.T','r.');
hold on
plot(xReconstructed,'go');

