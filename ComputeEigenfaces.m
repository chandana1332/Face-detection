
 function [mean_face, eigenfaces, A, pca] =ComputeEigenfaces(celebrity_directory, binary_mask)


ext_img = '*.jpg';

a = dir([celebrity_directory ext_img]);
n = max(size(a)) ; 
T =[];

for i=1:n
  temp=imread([celebrity_directory a(i).name]);
 temp = rgb2gray(temp);
T{i}=temp;

end

dim = ndims(T{1});         
 T = cat(dim+1,T{:}); 
 T=reshape(T,330*280,n);
b=binary_mask;
 
mean_face = mean(T,2); 
tnum = size(T,2);

A = [];  
for i = 1 : tnum
    temp = double(T(:,i)) - mean_face;
   temp=temp(b);
    A = [A temp]; 
end

Covar = A'*A; 
[V D] = eig(Covar);

eigv = [];
for i = 1 : size(V,2) 
    if( D(i,i)>1 )
        eigv = [eigv V(:,i)];
    end
end
pca=eigv
eigenfaces = A * eigv; 






