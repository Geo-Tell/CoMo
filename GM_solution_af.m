function [C,D,W,K]=GM_solution_af(X,Y,conf,W,a,lambda)
    beta=1;  
    K = vl_alldist(X',X');
    K=exp(-beta*K);
    K(K<0.1)=0;
 %%  
    num=size(K,2);
    for i=1:size(X,1)
        M(i,1:num)=X(i,1)*K(i,:);
        M(i,num+1:2*num)=X(i,2)*K(i,:);
        M(i,2*num+1:3*num)=K(i,:);
        M(i,3*num+1)=X(i,1);
        M(i,3*num+2)=X(i,2);
        M(i,3*num+3)=1;
        N(i)=Y(i);
    end; 
    inv_W = spalloc(3*num,3*num,3*num*num);
    inv_W(1:num,1:num)=diag(1./W);
    inv_W(num+1:2*num,num+1:2*num)=diag(1./W);
    inv_W(2*num+1:3*num,2*num+1:3*num)=diag(1./W);
    Y1=cat(1, Y, zeros(3*num,1));
    C = cat(1, M, sqrt(lambda)*cat(2,inv_W, zeros(3*num,3)))\Y1;
    V=M*C;
    %% using GM
    MIU=2*max(sum((Y-M*C).^2,2))/a;
    % Outer iteration
    while MIU>=1 
        % Inner iteration.
            % Fix the value of variable, update the weights   
            W=(MIU*a)./(sum((Y-V).^2,2)+(MIU*a).*ones(size(K,1),1));
            W=W.^2;
            % Fix the value of weights, update the variable                    
            V = M*C;                       
            inv_W = spalloc(3*num,3*num,3*num*num);
            inv_W(1:num,1:num)=diag(1./W);
            inv_W(num+1:2*num,num+1:2*num)=diag(1./W);
            inv_W(2*num+1:3*num,2*num+1:3*num)=diag(1./W); 
            C = cat(1, M, sqrt(lambda)*cat(2,inv_W, zeros(3*num,3)))\Y1;   
        % update MIU     
        MIU=MIU/1.4;  
    end
    D=M*C;
end