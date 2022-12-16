function error=get_error_af(num,aff_x1,aff_y1,K,C1,C2,f)
   wx=[C1(1:num) C1(num+1:2*num) C1(2*num+1:3*num)];
   ax0=[C1(3*num+1);C1(3*num+2);C1(3*num+3)];
   wy=[C2(1:num) C2(num+1:2*num) C2(2*num+1:3*num)];
   ay0=[C2(3*num+1);C2(3*num+2);C2(3*num+3)];
    Ax=K*wx;
    Ax(:,1)=Ax(:,1)+ax0(1);
    Ax(:,2)=Ax(:,2)+ax0(2);
    Ax(:,3)=Ax(:,3)+ax0(3);
    Ay=K*wy;
    Ay(:,1)=Ay(:,1)+ay0(1);
    Ay(:,2)=Ay(:,2)+ay0(2);
    Ay(:,3)=Ay(:,3)+ay0(3);
    x=sum(Ax'.*f(:,1:3)',1);
    y=sum(Ay'.*f(:,1:3)',1);
   error=(x-aff_x1').^2+(y-aff_y1').^2;
end