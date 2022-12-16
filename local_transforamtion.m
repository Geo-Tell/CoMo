function [af,Af,discard,Discard]=local_transforamtion(f1,f2,matches,matches_all)
    [af,discard] =get_similar(f1(3:4, matches(1,:))', f2(3:4, matches(2,:))');
    [Af,Discard]=get_similar(f1(3:4, matches_all(1,:))', f2(3:4, matches_all(2,:))');        
end