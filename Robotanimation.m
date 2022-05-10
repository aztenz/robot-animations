clc
clear
choose=input('Enter 2 for 2 link manipulator or 3 for 3 link manipulator:');
fst=input('Enter coordinates of initial point:');
lst=input('Enter coordinates of final point:');
l1=input('Enter the first arm length here:');
l2=input ('Enter the second arm length here:');
if choose==3
    l3=input ('Enter the third arm length here:');
    phi=input('Enter the phi coordinate here:')*pi/180;
end
x=linspace((fst(1)),(lst(1)),300);
y=linspace((fst(2)),(lst(2)),300);
n=length(x);
if choose==2
    for i=1:n
        cth2=((x(i)^2)+(y(i)^2)-(l1^2)-(l2^2))/(2*l1*l2);
        th2=acos(cth2);
        d=(l1^2)+(l2^2)+(2*l1*l2*cth2);
        cth1=((l1*x(i))+(l2*x(i)*cth2)+(l2*y(i)*sin(th2)))/d;
        sth1=(((l1+l2*cth2)*y(i))-(l2*sin(th2)*x(i)))/d;
        if((cth1>0)&& (sth1>0))
            th1= atan(abs(sth1)/abs(cth1));
        elseif((cth1>0)&& (sth1<0))
            th1 =2*pi - atan(abs(sth1)/abs(cth1));
        elseif((cth1<0)&& (sth1>0))
            th1 =pi - atan(abs(sth1)/abs(cth1));
        elseif((cth1<0)&& (sth1<0))
            th1 =pi + atan(abs(sth1)/abs(cth1));
        end
        X=l1*cos(th1);
        Y=l1*sin(th1);
        plot(x,y)
        hold on
        grid on
        plot([x(i) X 0], [y(i) Y 0])
        axis([-l1-l2 l1+l2 -l1-l2 l1+l2])
        pause(.0125)
        if i~=n
            clf
        end
    end
elseif choose==3
    for i=1:n
        wx = x(i)- l3*cos(phi);
        wy = y(i)- l3*sin(phi);
        cth2=((wx^2)+(wy^2)-(l1^2)-(l2^2))/(2*l1*l2);
        th2=acos(cth2);
        d=(l1^2)+(l2^2)+(2*l1*l2*cth2);
        cth1=((l1*wx)+(l2*wx*cth2)+(l2*wy*sin(th2)))/d;
        sth1=(((l1+l2*cth2)*wy)-(l2*sin(th2)*wx))/d;
        if((cth1>0)&& (sth1>0))
            th1= atan(abs(sth1)/abs(cth1));
        elseif((cth1>0)&& (sth1<0))
            th1 =2*pi - atan(abs(sth1)/abs(cth1));
        elseif((cth1<0)&& (sth1>0))
            th1 =pi - atan(abs(sth1)/abs(cth1));
        elseif((cth1<0)&& (sth1<0))
            th1 =pi + atan(abs(sth1)/abs(cth1));
        end
        th3 = phi - th1 - th2;
        x1=l1*cos(th1);
        y1=l1*sin(th1);
        x2=l1*cos(th1)+l2*cos(th1+th2);
        y2=l1*sin(th1)+l2*sin(th1+th2);
        plot(x,y)
        hold on
        grid on
        plot([x(i) x2 x1 0], [y(i) y2 y1 0])
        axis([-l1-l2 l1+l2 -l1-l2 l1+l2])
        pause(.0125)
        if i~=n
            clf
        end
    end
end