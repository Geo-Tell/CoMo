close all;clear;
config = [];
config = Our_init(config);
img_path='E:\ĞÂÂÛÎÄ\code\data\';
imgname1='09';
imgname2='055';
[inlier2,matches_all,f1,f2]=our_filter(img_path,imgname1,imgname2);
