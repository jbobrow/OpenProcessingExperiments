
int gX = 250;
int gY = 30;
int scale = 100;
int scale2 = 100;
int plX = 50;
int plY = 450;

float g = 9.81;
float k = 10;

float m1 = 0.5;
float m2 = 1;
int l = 1.5;
int l2 = 1;
float theta0 = 0.2*PI;
float u0 = 0.2;

float theta = theta0;
float dtheta = 0;
float ddtheta = 0;
float u = u0;
float du = 0;
float ddu = 0;

float[] ptheta = new float[400]; 
float[] pu = new float[400]; 


void setup() {  //setup function called initially, only once
  size(500, 600);
  background(255); 
  for(int i=0; i<400; i++){
      ptheta[i] = 0;
      pu[i] = 0;
  }
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
    
    stroke(0);
    line(gX, gY, gX + scale*2*l*sin(theta), gY + scale*2*l*cos(theta));
    fill(255,0,255);
    ellipse(gX + scale*2*l*sin(theta), gY + scale*2*l*cos(theta), 50, 50);
    line(gX + scale*l*sin(theta) + scale*l2*cos(theta), gY + scale*l*cos(theta) - scale*l2*sin(theta), gX + scale*l*sin(theta) - scale*l2*cos(theta), gY + scale*l*cos(theta) + scale*l2*sin(theta)); 
    fill(0,255,255);
    ellipse(gX + scale*l*sin(theta) + scale*u*cos(theta), gY + scale*l*cos(theta) - scale*u*sin(theta), 30, 30);
    
    ptheta[frameCount%401] = theta;
    pu[frameCount%401] = u;
        
    noStroke();
  for(int i=0; i<frameCount%401; i++){
    fill(255,0,255);
    ellipse(plX +  i, plY + scale2*ptheta[i], 5, 5);
    fill(0,255,255);
    ellipse(plX +  i, plY + scale2*pu[i], 5, 5);
  }
      stroke(0);
      line(plX, plY, plX+400, plY);
}


