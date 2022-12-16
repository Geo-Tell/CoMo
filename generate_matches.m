function [d1,d2,matches,matches_all]=generate_matches(d1,d2,SiftThreshold)
   [matches_1, matches_all_1]=vl_match_complete(d1', d2', SiftThreshold);
    % second-to-first
   [matches_2, matches_all_2]=vl_match_complete(d2', d1', SiftThreshold);
    if isempty(matches_1)==1
        matches=matches_2([2,1],:);
        matches_all=matches_all_2([2,1],:);
        return;
    end
     if isempty(matches_2)
        matches=matches_1;
        matches_all=matches_all_1;
         return;
     end    
    matches=intersect(matches_1',matches_2([2,1],:)','rows')';
%     matches=[matches_1,matches_2([2,1],:)];
%     matches=unique(matches','rows')';
    matches_all=[matches_all_1,matches_all_2([2,1],:)];
    matches_all=unique(matches_all','rows')'; 
    %% one-to-many removal
%     matches=one_to_many_removal(matches);
%     display_match_new_1(uint8(Img1), uint8(Img2), matches_1, f1(1:2,:),f2(1:2,:),'orignal') ;
%     ShowMatches_color_split(uint8(Img1),uint8(Img2), f1(1,matches_1(1,:))',f1(2,matches_1(1,:))',f2(1, matches_1(2,:))',f2(2, matches_1(2,:))',2,'y', 1, 1,'all_motion');
%     [H,inliers] = cv.findHomography(f1(1:2,matches_1(1,:))', f2(1:2,matches_1(2,:))', 'Method','Ransac');
%     display_match_new_1(uint8(Img1), uint8(Img2), matches, f1(1:2,:),f2(1:2,:),'ratio-test2') ;
%     matches_H=matches_1(:,find(inliers));
%     ShowMatches_color_split(uint8(Img1),uint8(Img2), f1(1,matches_H(1,:))',f1(2,matches_H(1,:))',f2(1, matches_H(2,:))',f2(2, matches_H(2,:))',2,'r', 1, 1,'all_motion');
end