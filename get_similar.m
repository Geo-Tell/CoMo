function [af,discard]= get_similar(param1, param2)
    [A1, S1] = similar_scale_fromSIFT(param1);
    [A2, S2]= similar_scale_fromSIFT(param2);
    af = zeros(size(A1, 1), 4);
    S=zeros(size(A1,1),1);
    for i = 1:size(af)
        af(i, :) = reshape((inv(reshape(A1(i, :), 2, 2)')*(reshape(A2(i, :), 2, 2)'))', 1, 4);
        S(i)=S2(i)/S1(i); % inverse scale
    end
    for i=1:size(af,1);
        af(i,:)=af(i,:)/S(i);
    end;
    M=sort(abs(af),2, 'descend');
    M=M(:,1)./M(:,2);
    discard=find(M> 5);
end