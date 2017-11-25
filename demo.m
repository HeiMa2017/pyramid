clear;
clc;
close all;

img = imread('ngc6543a.jpg');
img = rgb2gray(img);
img = imresize(img, [512, 512]);
% �ֽ�
level = 5;
imgLaplacian = pyramiddec(img,level);
figure, 
subplot(221), imshow(mat2gray(imgLaplacian{1}));
subplot(222), imshow(mat2gray(imgLaplacian{2}));
subplot(223), imshow(mat2gray(imgLaplacian{3}));
subplot(224), imshow(mat2gray(imgLaplacian{4}));

% �ع�
imgRec = pyramidrec(imgLaplacian);
figure, 
subplot(121),imshow(imgRec);
subplot(122),imshow(img);

% ��֤�ع�ͼ���Ƿ���ȷ
imgRec = im2uint8(mat2gray(imgRec));
delta = sum(sum(img - imgRec))