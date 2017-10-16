%-- Tests growcut.m

%-- Load image and seeds
img = imread('lotus.png');
labels = double(imread('labels.png'))-1;

subplot(2,2,1), imshow(img);
subplot(2,2,2), imshow(labels,[]);
subplot(2,2,3), imshow(img);

%-- For segmentation
[labels_out, strengths] = growcut(img,labels);

%-- For Smoothing
labels_out = medfilt2(labels_out,[3,3]);

hold on;
contour(labels_out,[0 0],'g','linewidth',4);
contour(labels_out,[0 0],'k','linewidth',2);
hold off;

subplot(2,2,4), imshow(labels_out);
