function OutputName = ComputeLookAlike(TestImage, m, A, Eigenfaces,b)

Proj = [];
Train_Number = size(Eigenfaces,2);
for i = 1 : Train_Number
    temp = Eigenfaces'*A(:,i); % Projection of centered images into facespace
    Proj = [Proj temp]; 
end

InputImage = imread(TestImage);
temp = rgb2gray(InputImage);

[irow icol] = size(temp);
InImage = reshape(temp',irow*icol,1);
Difference = double(InImage)-m;
Difference=Difference(b);
% Centered test image
%disp(size(Eigenfaces'));
%disp(size(Difference));
ProjectedTestImage = Eigenfaces'*Difference; 
Euc_dist = [];
for i = 1 : Train_Number
    q = Proj(:,i);
    temp = ( norm( ProjectedTestImage - q ) )^2;
    %disp(i);
    %disp(temp);
    Euc_dist = [Euc_dist temp];
end

OutputName =Euc_dist ;
