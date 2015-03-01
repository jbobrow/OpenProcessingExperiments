
int gX = 250;
int gY = 100;
int scale = 100;

float g = 9.81;
float k = 5;

float m1 = 0.5;
float m2 = 1;
int l = 1.5;
int l2 = 1;
float theta0 = 0.2*PI;
float u0 = 0;

float theta = theta0;
float dtheta = 0;
float ddtheta = 0;
float u = u0;
float du = 0;
float ddu = 0;


void setup() {  //setup function called initially, only once
  size(500, 500);
  background(255); 
}

void draw() { 
    background(255);
    
    float s1 = 4*m1*l*l + m2*u*u;
    ddtheta = ( -2*m1*g*l*sin(theta) - m2*g*(l*sin(theta)+u*cos(theta)) + 2*l*k*u + m2*l*g*sin(theta) )/s1;
    ddu = ( - 2*l*k*u - m2*l*g*sin(theta) - m2*l*ddtheta )/m2;

    dtheta += ddtheta/60.0;
    du += ddu/60.0;
    theta += dtheta/60.0;
    u += du/60.0;
    
    line(gX, gY, gX + scale*2*l*sin(theta), gY + scale*2*l*cos(theta));
    ellipse(gX + scale*2*l*sin(theta), gY + scale*2*l*cos(theta), 50, 50);
    line(gX + scale*l*sin(theta) + scale*l2*cos(theta), gY + scale*l*cos(theta) - scale*l2*sin(theta), gX + scale*l*sin(theta) - scale*l2*cos(theta), gY + scale*l*cos(theta) + scale*l2*sin(theta)); 
    ellipse(gX + scale*l*sin(theta) + scale*u*cos(theta), gY + scale*l*cos(theta) - scale*u*sin(theta), 30, 30);

}

