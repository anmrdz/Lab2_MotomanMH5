body1 = rigidBody('body1');
jnt1 = rigidBodyJoint('jnt1','revolute'); %define que tipo de articulación y el nombre
jnt1.HomePosition = 0;
tform = trvec2tform([0, 0, 0.33])*eul2tform([0, 0, 0]); % User defined. MTH
setFixedTransform(jnt1,tform);
body1.Joint = jnt1;
robot = rigidBodyTree;
addBody(robot,body1,'base')

body2 = rigidBody('body2');
jnt2 = rigidBodyJoint('jnt2','revolute');
jnt2.HomePosition = 0;
tform2 = trvec2tform([0.088, 0, 0])*eul2tform([pi/2, -pi/2, 0]); % User defined
setFixedTransform(jnt2,tform2);
body2.Joint = jnt2;
addBody(robot,body2,'body1'); % Add body2 to body1

body3 = rigidBody('body3');
jnt3 = rigidBodyJoint('jnt3','revolute');
jnt3.HomePosition = 0; % User defined
tform3 = trvec2tform([0.31, 0, 0])*eul2tform([0, 0, 0]);  % User defined
setFixedTransform(jnt3,tform3);
body3.Joint = jnt3;
addBody(robot,body3,'body2'); % Add body3 to body2

body4 = rigidBody('body4');
jnt4 = rigidBodyJoint('jnt4','revolute');
jnt4.HomePosition = 0; % User defined
tform4 = trvec2tform([0.04, -0.305, 0])*eul2tform([0, 0, pi/2]); % User defined
setFixedTransform(jnt4,tform4);
body4.Joint = jnt4;
addBody(robot,body4,'body3'); % Add body4 to body3

body5 = rigidBody('body5');
jnt5 = rigidBodyJoint('jnt5','revolute');
jnt5.HomePosition = 0; % User defined
tform5 = trvec2tform([0, 0, 0])*eul2tform([0, 0, -pi/2]); % User defined
setFixedTransform(jnt5,tform5);
body5.Joint = jnt5;
addBody(robot,body5,'body4'); % Add body5 to body4

body6 = rigidBody('body6');
jnt6 = rigidBodyJoint('jnt6','revolute');
jnt6.HomePosition = 0; % User defined
tform6 = trvec2tform([0, -0.0865, 0])*eul2tform([0, 0, pi/2]); % User defined
setFixedTransform(jnt6,tform6);
body6.Joint = jnt6;
addBody(robot,body6,'body5'); % Add body6 to body5


config = randomConfiguration(robot);
config1 = [0.5, 0.2, 0.4, 0.5, 0, 1.5];
config2 = [pi/2, 0.3, 0, pi/2, 0.4, 1.2];
config3 = [0, 1, -0.5 2 1 0.5];
config4 = [-1, -0.3, -pi/5, 0.4 0.2 1];

config(1).JointPosition = config1(1);
config(2).JointPosition = config1(2);
config(3).JointPosition = config1(3);
config(4).JointPosition = config1(4);
config(5).JointPosition = config1(5);
config(6).JointPosition = config1(6);

show(robot,config)

tform = getTransform(robot,config,'body6','base')
config(1).JointPosition = config2(1);
config(2).JointPosition = config2(2);
config(3).JointPosition = config2(3);
config(4).JointPosition = config2(4);
config(5).JointPosition = config2(5);
config(6).JointPosition = config2(6);

show(robot,config)

tform2 = getTransform(robot,config,'body6','base')

config(1).JointPosition = config3(1);
config(2).JointPosition = config3(2);
config(3).JointPosition = config3(3);
config(4).JointPosition = config3(4);
config(5).JointPosition = config3(5);
config(6).JointPosition = config3(6);

show(robot,config)

tform3 = getTransform(robot,config,'body6','base')

config(1).JointPosition = config4(1);
config(2).JointPosition = config4(2);
config(3).JointPosition = config4(3);
config(4).JointPosition = config4(4);
config(5).JointPosition = config4(5);
config(6).JointPosition = config4(6);

show(robot,config)

tform4 = getTransform(robot,config,'body6','base')
showdetails(robot);

show(robot,config)
hold on
axis([-1 1 -1 1 -0.1 1.5]);