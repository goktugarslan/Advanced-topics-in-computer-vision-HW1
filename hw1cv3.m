clear all;
clc;
a=imread('Figure_1.png');
b(:,:,1)= medfilt2(a(:,:,1));
b(:,:,2)= medfilt2(a(:,:,2));
b(:,:,3)= medfilt2(a(:,:,3));

figure
subplot(2,1,1),imshow(a);
subplot(2,1,2),imshow(b);