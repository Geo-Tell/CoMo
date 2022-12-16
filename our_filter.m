function  [inlier2,matches_all,f1,f2]=our_filter(img_path,imgname1,imgname2)
    SiftThreshold= 0.8;
    conf = [];
    conf = Our_init(conf);   
    I1=imread(strcat(img_path,imgname1,'.jpg'));
    I2=imread(strcat(img_path,imgname2,'.jpg'));
    [f1,d1]=extract_features(I1);  
    [f2,d2]=extract_features(I2); 
    d1 = truncateVLSIFT(d1, 0.2);
    d2 = truncateVLSIFT(d2, 0.2);
    [~,~,matches,matches_all]=generate_matches(d1,d2,SiftThreshold);
%% core algorithm  
    [af,Af,discard,Discard]=local_transforamtion(f1,f2,matches,matches_all);
    af(discard,:)=[];Af(Discard,:)=[];
    matches(:,discard)=[];matches_all(:,Discard)=[];
    inlier2=robust_filter(f1,f2,matches,matches_all,conf,I1,I2,af,Af);
end