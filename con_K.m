function K=con_K(x,y,beta)
% [mIdx,mD] = knnsearch(x,x,'K',50,'Distance','euclidean');
% r=mD(:,end)+mD(:,2)+1e-5-sum(mD,2)./50;
% CON_K constructs the kernel K, 
%   where K(i, j) = k(x, y) = exp(-beta*||x-y||^2).

% [n, d]=size(x); [m, d]=size(y);
% beta=1/d;
% K=repmat(x,[1 1 m])-permute(repmat(y,[1 1 n]),[3 2 1]);
% K=squeeze(sum(K.^2,2));
% K=-beta * K;
% % K=-(1/2*(beta)^2) * K;
% K=exp(K);
K = vl_alldist(x',y');
%G=G.^2;
% if flag==1
    K=exp(-beta*K);
% else
%     K=exp(-(K./(r.^2)));
% end
% K=1-K./(K+beta.^2);
