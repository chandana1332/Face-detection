%runfile - script used to complete homework 5
tic;

myDir = 'CelebrityDatabase/';
ext_img = '*.jpg';
b= load('binary_mask.mat');
b=struct2cell(b);
b=cell2mat(b);
 b=b(:,:,1);
b=reshape(b,330*280,1); 
[mean_face, eigenfaces, A, pca]=ComputeEigenfaces(myDir,b);
a = dir([myDir ext_img]);
TestImage='TestImages/zBrad Pitt.jpg';

re=ComputeLookAlike(TestImage, mean_face, A, eigenfaces,b);
[X1,map1]=imread(TestImage);

[Euc_dist_min , Recognized_index] = min(re);
disp(Recognized_index);
re(Recognized_index)=[];
[X2,map2]=imread([myDir a(Recognized_index).name]);
disp(Euc_dist_min);

[Euc_dist_min , Recognized_index] = min(re);
disp(Recognized_index);
re(Recognized_index)=[];
[X3,map3]=imread([myDir a(Recognized_index).name]);
disp(Euc_dist_min);


[Euc_dist_min , Recognized_index] = min(re);
disp(Recognized_index);
re(Recognized_index)=[];
[X4,map4]=imread([myDir a(Recognized_index).name]);
disp(Euc_dist_min);


subplot(1,4,1), imshow(X1,map1)
title('Original Image');
subplot(1,4,2), imshow(X2,map2)
title('First match');
subplot(1,4,3), imshow(X3,map3)
title('Second match');
subplot(1,4,4), imshow(X4,map4)
title('Third match');



toc
