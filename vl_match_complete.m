function [matches, matches_c]=vl_match_complete(d1, d2, thres)
    matcher = cv.DescriptorMatcher('BFMatcher','NormType','L2');
    matches=[];matches_c=[];
    tmatches = matcher.knnMatch(d1, d2, 2);
    % dists = cellfun(@(m) m(1).distance, matches);
    idx1 = cellfun(@(m) (numel(m) == 2) && ...
        ((m(1).distance)^2 < thres * (m(2).distance)^2 ), tmatches);
    matches = cellfun(@(m) m(1), tmatches(idx1));
    if isempty(matches)
        return;
    end
    matches=[cat(1,matches.queryIdx)+1,cat(1,matches.trainIdx)+1]';
    % score= cellfun(@(m) ((m(1).distance)^2/(m(2).distance)^2 ), tmatches(idx1));

    idx2 = cellfun(@(m) (numel(m) == 2) && ((m(1).distance)^2 <1* (m(2).distance)^2), tmatches);
    matches_c = cellfun(@(m) m(1), tmatches(idx2));
    matches_c=[cat(1,matches_c.queryIdx)+1,cat(1,matches_c.trainIdx)+1]';
end