function [C,D]=GM_solution(X,Y,conf)
    beta=conf.beta;  
    K = vl_alldist(X',X');
    K=exp(-beta*K);
    K(K<0.1)=0; 
    X=X(:,1);
    W=ones(size(X,1),1);
    inv_W = diag(1./W);
    lambda=conf.lambda1;  
    a=0.09;
    C = (K+lambda*inv_W)\Y;
    V=K*C;
    %% using GM
    MIU=2*max(sum((Y-K*C).^2,2))/a;
    % Outer iteration
    while MIU>=1
        % Inner iteration.
            % Fix the value of variable, update the weights   
            W=(MIU*a)./(sum((Y-V).^2,2)+(MIU*a).*ones(size(X,1),1));
            W=W.^2;
            % Fix the value of weights, update the variable                    
            V = K*C;                       
            inv_W = diag(1./W);  
            C = (K+lambda*inv_W)\Y;     
        % update MIU     
        MIU=MIU/1.4;  
    end
    D=K*C;
%     inlier=inlier_determine(K*C);
end