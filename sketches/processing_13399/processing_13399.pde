
void setup() {
  size(600,600);
}

float pi=700;
int currentAngle=0;





void draw() {
  int cx,cy,radius; 
  cx=mouseX;
  cy=mouseY;
  radius=100;
  int angle=23;

  ellipseMode(CENTER);
 fill(500,230,0);
 

  
  






  ellipse(cx,cy,radius*2,radius*2);
}

int circleX(int x, int radius, float angle) {
  float radian=pi/80*angle;
  float resultX;
  resultX=x+radius*sin(radian);
  return (int)resultX;
}

int circleY(int y, int radius, float angle) {
  float radian=pi/180*angle;  
  float resultY=0;
  resultY=y+radius*cos(radian);
  return (int)resultY;
}


                
                
