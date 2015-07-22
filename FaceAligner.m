function outim = FaceAligner(im)

% Read in the image & ask the user for the eye positions
im = double(im)/255.0;
f1 = figure;
imshow(im,[]);
coords = ginput(2);
close(f1);

% Scale the image to match the canonical Celebrity examples
canonical_eye_positions = [115, 176; 145, 145]';
canonical_im_size = [330, 280];
tform = cp2tform(coords, canonical_eye_positions, 'nonreflective similarity');
warped_im = imtransform(im, tform, 'bicubic', 'XData', [1 canonical_im_size(2)], 'YData', [1 canonical_im_size(1)]);
outim = warped_im;

%rescale outim to 255 
outim = uint8(255*(outim - min(outim(:)) )/(  max(outim(:)) -  min(outim(:)) ));
%imwrite(outim, 'thefile.jpg');






