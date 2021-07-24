function Serial = MotomanDC(q)
% syms q1 q2 q3 q4 q5 q6 dot_q1 dot_q2 dot_q3 dot_q4 dot_q5 dot_q6
% q = [0 0 0 0 0 0];
% ws =   [-1 1 -1 1 -1 1];

%            Theta  d   a   alpha  type mdh offset  qlim
L6(1) = Link('revolute','alpha',    0,  'a',0,       'd',330/1000, 'offset',    0, 'qlim',  [-17*pi/18 17*pi/18],   'modified');
L6(2) = Link('revolute','alpha', pi/2,  'a',88/1000, 'd',0,        'offset', pi/2, 'qlim',  [-13*pi/36 5*pi/6],   'modified');
L6(3) = Link('revolute','alpha',    0,  'a',310/1000,'d',0,        'offset',    0, 'qlim',  [-34*pi/45 17*pi/12],   'modified');
L6(4) = Link('revolute','alpha', pi/2,  'a',40/1000, 'd',305/1000, 'offset',    0, 'qlim',  [-19*pi/18 19*pi/18],   'modified');
L6(5) = Link('revolute','alpha',-pi/2,  'a',0,       'd',0,        'offset',    0, 'qlim',  [-25*pi/36 25*pi/36],   'modified');
L6(6) = Link('revolute','alpha', pi/2,  'a',0,       'd',86.5/1000,'offset',    0, 'qlim',  [-2*pi 2*pi],   'modified');



MotomanMH5 = SerialLink(L6,'name','Motoman');
Serial = MotomanMH5;
% MotomanMH5.plot(q,'workspace',ws,'view',[10 10])
end