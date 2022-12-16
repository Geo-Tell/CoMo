function [f,d]=extract_features(Img)
    detector = cv.SIFT('NFeatures',8000,'ConstrastThreshold',1e-5);
    mask=ones(size(Img,1),size(Img,2),1);
    [kp, d]= detector.detectAndCompute(Img, 'Mask',mask);      
    d=uint8(d)';
    f=[cat(1,kp.pt),cat(1,kp.size),(cat(1,kp.angle).*pi)./180;]'; 
end