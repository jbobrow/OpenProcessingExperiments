
//basics of variables using int and float
size(480, 420);

int pendulumMiddleX = 300;
int pendulumMiddleY = 260;
int pendulumWidth = 50;

float pendulum_end_x = 200;
float pendulum_end_y = 183.2;

ellipse(pendulumMiddleX, pendulumMiddleY, pendulumWidth, pendulumWidth);
line(pendulumMiddleX, pendulumMiddleY, pendulum_end_x, pendulum_end_y);
line(pendulumMiddleX + pendulumWidth/2, pendulumMiddleY, pendulum_end_x, pendulum_end_y);
line(pendulumMiddleX - pendulumWidth/2, pendulumMiddleY, pendulum_end_x, pendulum_end_y);

