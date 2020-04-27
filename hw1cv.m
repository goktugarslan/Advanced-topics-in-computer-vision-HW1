clear all;
clc;
a=imread('sunnylake.bmp');
for x=1:300
    for y=1:0400
        I(x,y)=(a(x,y,1)+a(x,y,2)+a(x,y,3))/3;
    end
end
B=im2bw(I,0.3);
figure
subplot(2,2,1), imshow(a);
subplot(2,2,2),imshow(I);
subplot(2,2,3),histogram(I);
subplot(2,2,4),imshow(B);