close all;clear;
img_path='dataset\';
imgname1='1';
imgname2='2';
[inlier2,matches_all,f1,f2]=our_filter(img_path,imgname1,imgname2);
