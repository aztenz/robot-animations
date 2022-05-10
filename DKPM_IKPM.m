userin=input('for 2 link manipulator enter 1,for 3 link manipulator enter 2');
if userin==1
    while 1
        choose=input('To calculate DKPM press 1,if you want to calculate IKPM press 2:');
        l1=input('Enter the first arm length here:');
        l2=input('Enter the second arm length here:');
        if choose==1
            clc
            while 1
                q1=input('Enter Range Of First Link Angle (Degrees):').*pi/180;
                q2=input('Enter Range Of Second Link Angle (Degrees):').*pi/180;
                if (q1(1)<=q1(2))&&(q2(1)<=q2(2))
                    break
                    clc
                else
                    fprintf('Angle Input Error!\n');
                end
            end
            while 1
                fprintf('Calculating Exact End Effector''s Possition:\n');
                th1=input('Enter The First Link Angle:')*pi/180;
                th2=input('Enter The Second Link Angle:')*pi/180;
                if(q1(1)<=th1)&&(th1<=q1(2))&&(q2(1)<=th2)&&(th2<=q2(2))
                    X=(l1*cos(th1))+(l2*cos((th1+th2)));
                    Y=(l1*sin(th1))+(l2*sin((th1+th2)));
                    fprintf('X Coordinate = %f\n', X);
                    fprintf('Y Coordinate = %f\n', Y);
                    break
                    clear
                else
                    dummy=input('Angle Input Error!:','s');
                    clc
                end
            end
            break
        elseif choose==2
            x=input('Enter the x coordinate here:');
            y=input('Enter the y coordinate here:');
            cth2=((x^2)+(y^2)-(l1^2)-(l2^2))/(2*l1*l2);
            th2=acos(cth2);
            d=(l1^2)+(l2^2)+(2*l1*l2*cth2);
            cth1=((l1*x)+(l2*x*cth2)+(l2*y*sin(th2)))/d;
            sth1=(((l1+l2*cth2)*y)-(l2*sin(th2)*x))/d;
            if((cth1>0)&& (sth1>0))
                th1= atan(abs(sth1)/abs(cth1));
            elseif((cth1>0)&& (sth1<0))
                th1 =2*pi - atan(abs(sth1)/abs(cth1));
            elseif((cth1<0)&& (sth1>0))
                th1 =pi - atan(abs(sth1)/abs(cth1));
            elseif((cth1<0)&& (sth1<0))
                th1 =pi + atan(abs(sth1)/abs(cth1));
            end
            fprintf('First Arm Angle =%.5f\n',th1*(180/pi));
            fprintf('Second Arm Angle =%.5f\n',th2*(180/pi));
            break
        else dummy=input('Wrong Choise!');
        end
    end
elseif userin== 2
    l1=input ('Enter the first arm length here:');
    l2=input ('Enter the second arm length here:');
    l3=input ('Enter the third arm length here:');
    choose=input('To calculate DKPM press 1,if you want to calculate IKPM press 2:');
    if choose == 1
        th1=input('Enter The First Link Angle:')*pi/180;
        th2=input('Enter The Second Link Angle:')*pi/180;
        th3=input('Enter The third Link Angle:')*pi/180;
        X=(l1*cos(th1))+(l2*cos((th1+th2)))+(l3*cos((th1+th2+th3)));
        Y=(l1*sin(th1))+(l2*sin((th1+th2)))+(l3*sin((th1+th2+th3)));
        phi = th1+th2+th3;
        fprintf('X Coordinate = %f\n', X);
        fprintf('Y Coordinate = %f\n', Y);
        fprintf(' summation of angles in degrees = %f\n', phi*180/pi);
    elseif choose==2
        x=input('Enter the x coordinate here:');
        y=input('Enter the y coordinate here:');
        phi=input('Enter the phi in degrees here:')*pi/180;
        wx = x- l3*cos(phi);
        wy = y- l3*sin(phi);
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
            th1 =pi - a;
            tan(abs(sth1)/abs(cth1));
        elseif((cth1<0)&& (sth1<0))
            th1 =pi + atan(abs(sth1)/abs(cth1));
        end
        th3 = phi - th1 - th2;
        fprintf('First Arm Angle =%.5f\n',th1*(180/pi));
        fprintf('Second Arm Angle =%.5f\n',th2*(180/pi));
        fprintf('third Arm Angle =%.5f\n',th3*(180/pi));
    else disp('Wrong Choise!');
    end
else disp('wrong choise!');
end