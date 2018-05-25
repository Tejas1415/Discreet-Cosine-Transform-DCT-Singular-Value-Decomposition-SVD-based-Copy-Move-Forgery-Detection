clc
clear all
close all

Q75 = [8    6    5    8    12    20    26    31;
    6    6    7    10    13    29    30    28;
    7    7    8    12    20    29    35    28;
    7    9    11    15    26    44    40    31;
    9    11    19    28    34   55   52    39;
    12    18    28    32    41   52   57    46;
    25    32    39    44   52   61   60   52;
    36    46    48    49   56   50   52    50 ];
i1=imread('tamp5.jpg'); 
i2=rgb2gray(i1);
figure,imshow(i2), title('Before Rclose esize');
i2=imresize(i2, [128 128]);
figure, imshow(i2); title('i2');
[row, col] = size(i2);
i2=im2double(i2);
  
count5=0;
V=zeros(64,1);
counti=0;countj=0;S=zeros(1,2);add2=zeros(size(S));
Blocks2 = cell(row/8,col/8);
for i=1:row-7
    counti = counti + 1;
   countj = 0;
    for j=1:col-7
        
        countj = countj + 1;
        Blocks2{i,j} = i2(i:i+7,j:j+7);
       count5=count5+1;
        D = dctmtx(size(Blocks2{i,j},1));
        dct = D*Blocks2{i,j}*D';
        K = dct./Q75;
       %dct=abs(dct);
        K1= round(K);   
        V= horzcat(V,K1(:));
        S=[counti countj];
        add2= vertcat(add2,S);   
    end
end
L= transpose(V);
L(1,:)=[];
add2(1,:)=[];
L=[L add2];

L1=sortrows(L);

S2= [L1(:,end-1) L1(:,end)];


L1(:,end-1)=[];
L1(:,end)=[];

count2=0;count3=0;
shiftvector=zeros(1,2); copy=zeros(1,6);
for i=2:14641
    K2=0; J2=0;
    switch any(L1(i,:))
        case 0
            count2=count2+1;
        case 1     
        count3=count3+1;
        K2=S2(i,1); J2=S2(i,2);
        K3=S2(i-1,1); J3= S2(i-1,2);
        s1= K2-K3; s2=J2-J3;
        s=[s1 s2];
        shiftvector = vertcat(shiftvector,s);
        c= [K2 J2 K3 J3 s1 s2];
        copy= vertcat(copy,c);
    end
end
copy(1,:)=[];


 shiftvector(1,:)=[];
 shiftvector= abs(shiftvector);
matrix = unique(shiftvector, 'rows', 'stable');

[row2, col2]= size(shiftvector);
[row3, col3]= size(matrix);
cnt=0; repetition= zeros(row3,1);
for i=1:row3
    for j=1:row2
    if (matrix(i,:)== shiftvector(j,:))
        cnt=cnt+1;
    end
    end
        repetition(i,1)=cnt;
        cnt=0;
end

threshold = repetition > 400;

V2 = zeros(64,64);
c6=0;c7=0;
for i=1:row3
    if(threshold(i,:)==1)
        rep1= matrix(i,1);
        rep2= matrix(i,2);
        c7=c7+1;
     for j=2:row2
         if(shiftvector(j,:)==[rep1 rep2])
             rep3= copy(j,1); rep4= copy(j,2);
             rep5=copy(j,3); rep6=copy(j,4);
             V2(rep3:rep3+7, rep4:rep4+7)= ones(8,8);
             V2(rep5:rep5+7, rep6:rep6+7)= ones(8,8);
             c6=c6+1;
         end
     end
    end
end
figure,imshow(V2); title('copy moved part');
 
