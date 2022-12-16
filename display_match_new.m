function []=  display_match_new(Ia, Ib, matches, fa, fb,name)
% if size(Ia,2)> size(Ib,2)
%     Ib(:, size(Ib,2):size(Ia,2), :)=255;
% else
%     Ia(:, size(Ia,2):size(Ib,2), :)=255;
% end;
if size(Ia,2)> size(Ib,2)
    factor=size(Ia,2)/size(Ib,2); 
    Ib=imresize(Ib, [size(Ib,1)*factor, size(Ia,2)]);
else
    factor=size(Ia,2)/size(Ib,2);
    Ib=imresize(Ib, [size(Ib,1)*factor, size(Ia,2)]);
end
figure;
interval = 20;
WhiteInterval = 255*ones(interval,size(Ia,2) , 3);
imagesc(cat(1, Ia, WhiteInterval, Ib)) ;
xa = fa(1,matches(1,:)) ;
xb = factor*fb(1,matches(2,:)) ;
ya = fa(2,matches(1,:)) ;
yb = factor*fb(2,matches(2,:)) +interval+size(Ia,1) ;
hold on ;
str = '#FF4500';
color = sscanf(str(2:end),'%2x%2x%2x',[1 3])/255;
h = line([xa ; xb], [ya ; yb]) ;
set(h,'linewidth',1, 'color',[0,0.67,0]) ;
% vl_plotframe(fa(:,matches(1,:))) ;
% fb_s=factor*fb;
% fb_s(2,:) = factor*fb(2,:) + interval+size(Ia,1) ;
% vl_plotframe(fb_s(:,matches(2,:))) ;
set(gca,'looseInset',[0 0 0 0])
axis image off ;


