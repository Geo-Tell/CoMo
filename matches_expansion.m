function inlier=matches_expansion(f1,f2,matches,Aff,X,C,conf)
   Mf1=f1(matches(1,:),:);
   Mf2=f2(matches(2,:),:);
%    Aff=[];
   X_1=cat(2,Mf1(:,1:2),Mf2(:,1:2),Aff);
   G1=con_K(X_1,X,conf.beta);
   G1(G1<0.1)=0;
   inlier=find(G1*C>0.5);
end