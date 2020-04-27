clear all;
clc;
a=imread('sunnylake.bmp');
g1=uint8(randn(300,400)*1);
g5=uint8(randn(300,400)*5);
g10=uint8(randn(300,400)*10);
g20=uint8(randn(300,400)*20);
b(:,:,1)=a(:,:,1)+g1;
b(:,:,2)=a(:,:,2)+g1;
b(:,:,3)=a(:,:,3)+g1;

c(:,:,1)=a(:,:,1)+g5;
c(:,:,2)=a(:,:,2)+g5;
c(:,:,3)=a(:,:,3)+g5;

d(:,:,1)=a(:,:,1)+g10;
d(:,:,2)=a(:,:,2)+g10;
d(:,:,3)=a(:,:,3)+g10;

e(:,:,1)=a(:,:,1)+g20;
e(:,:,2)=a(:,:,2)+g20;
e(:,:,3)=a(:,:,3)+g20;
for x=1:300
    for y=1:0400
        I_1(x,y)=(b(x,y,1)+b(x,y,2)+b(x,y,3))/3;
    end
end
for x=1:300
    for y=1:0400
        I_5(x,y)=(c(x,y,1)+c(x,y,2)+c(x,y,3))/3;
    end
end
for x=1:300
    for y=1:0400
        I_10(x,y)=(d(x,y,1)+d(x,y,2)+d(x,y,3))/3;
    end
end
for x=1:300
    for y=1:0400
        I_20(x,y)=(e(x,y,1)+e(x,y,2)+e(x,y,3))/3;
    end
end
kernel1=ones(3)/9;
LPI_1=imfilter(I_1, kernel1, 'replicate');
LPI_5=imfilter(I_5, kernel1, 'replicate');
LPI_10=imfilter(I_10, kernel1, 'replicate');
LPI_20=imfilter(I_20, kernel1, 'replicate');

kernel2=[1,2,1;2,4,2;1,2,1];
LPGI_1=imfilter(I_1, kernel2, 'replicate');
LPGI_5=imfilter(I_5, kernel2,'replicate');
LPGI_10=imfilter(I_10, kernel2, 'replicate');
LPGI_20=imfilter(I_20, kernel2, 'replicate');

kernel3=[-1,-1,-1;-1,8,-1;-1,-1,-1];
HPI_1=imfilter(I_1, kernel3, 'replicate');
HPI_5=imfilter(I_5, kernel3, 'replicate');
HPI_10=imfilter(I_10, kernel3, 'replicate');
HPI_20=imfilter(I_20, kernel3, 'replicate');

kernel4=[-1,-1,-1;-1,17,-1;-1,-1,-1];%for A=2
HP2I_1=imfilter(I_1, kernel4, 'replicate');
HP2I_5=imfilter(I_5, kernel4, 'replicate');
HP2I_10=imfilter(I_10, kernel4, 'replicate');
HP2I_20=imfilter(I_20, kernel4, 'replicate');

figure
subplot(2,2,1), imshow(b),title('1 var gaussian noise');
subplot(2,2,2),imshow(c),title('5 var gaussian noise');
subplot(2,2,3), imshow(d),title('10 var gaussian noise ');
subplot(2,2,4),imshow(e),title('20 var gaussian noise');

figure
subplot(2,2,1), imshow(I_1),title('1 var gaussian noise rgb mean');
subplot(2,2,2),imshow(I_5),title('5 var gaussian noise rgb mean');
subplot(2,2,3), imshow(I_10),title('10 var gaussian noise rgb mean');
subplot(2,2,4),imshow(I_20),title('20 var gaussian noise rgb mean');

figure
subplot(2,2,1), imshow(LPI_1),title('1 var gaussian noise 3x3 mean');
subplot(2,2,2),imshow(LPI_5),title('5 var gaussian noise 3x3 mean');
subplot(2,2,3), imshow(LPI_10),title('10 var gaussian noise 3x3 mean');
subplot(2,2,4),imshow(LPI_20),title('20 var gaussian noise 3x3 mean');

figure
subplot(2,2,1), imshow(LPGI_1),title('1 var gaussian noise 3x3 gaussian LP');
subplot(2,2,2),imshow(LPGI_5),title('5 var gaussian noise 3x3 gaussian LP');
subplot(2,2,3), imshow(LPGI_10),title('10 var gaussian noise 3x3 gaussian LP');
subplot(2,2,4),imshow(LPGI_20),title('20 var gaussian noise 3x3 gaussian LP');

figure
subplot(2,2,1), imshow(HPI_1),title('1 var gaussian noise 3x3 high pass');
subplot(2,2,2),imshow(HPI_5),title('5 var gaussian noise 3x3 high pass');
subplot(2,2,3), imshow(HPI_10),title('10 var gaussian noise 3x3 high pass');
subplot(2,2,4),imshow(HPI_20),title('20 var gaussian noise 3x3 high pass');

figure
subplot(2,2,1), imshow(HP2I_1),title('1 var gaussian noise 3x3 high boost');
subplot(2,2,2),imshow(HP2I_5),title('5 var gaussian noise 3x3 high boost');
subplot(2,2,3), imshow(HP2I_10),title('10 var gaussian noise 3x3 high boost');
subplot(2,2,4),imshow(HP2I_20),title('20 var gaussian noise 3x3 high boost');
