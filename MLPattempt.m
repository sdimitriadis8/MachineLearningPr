load digits
X=learn.P;

target = zeros(10,size(learn.T,2));
for i = 1:size(learn.T,2)
   j = learn.T(i)+1;
    target(j,i) = 1; 
end
nprtool

