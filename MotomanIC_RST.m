function [q_inv1,q_inv2,q_inv3,q_inv4,q_inv5,q_inv6] = MotomanIC_RST(posicion,orientacion,isElbowUp,rigidBodyJoint)
    R=eul2rotm(orientacion,'xyz');
    Oc = posicion-(86.5/1000)*R*[0;0;1];
    xc=Oc(1);
    yc=Oc(2);
    zc=Oc(3);
    
    q_inv1=atan2(yc,xc);
    
    d=sqrt(xc^2+yc^2)-(88/1000);
    s=zc-(330/1000);
    a=sqrt((40/1000)^2+(305/1000)^2);
    r2=s^2+d^2;
    D=(r2-a^2-(310/1000)^2)/(2*a*(310/1000));
    if isElbowUp
        q3_=atan2(-sqrt(1-D^2),D);
    else
        q3_=atan2(sqrt(1-D^2),D);
    end
    
    q_inv3 = q3_ + atan2(305,40);
    
    q2_=atan2(-d,s);
    
    q_inv2=q2_-atan2(a*sin(q3_),(310/1000)+a*cos(q3_));
    
    config=homeConfiguration(rigidBodyJoint);
    config(1).JointPosition=q_inv1;
    config(2).JointPosition=q_inv2;
    config(3).JointPosition=q_inv3;
    
    R0_3=getTransform(rigidBodyJoint,config,'body3','base');
    R3_6=inv(tr2rt(R0_3))*R;
    
    angulos=rotm2eul(rotx(-90,'deg')*R3_6,'zyz');    
    q_inv4=angulos(1);
    q_inv5=angulos(2);
    q_inv6=angulos(3);
    
end