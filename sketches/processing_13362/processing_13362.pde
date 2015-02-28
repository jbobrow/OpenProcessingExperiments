
void setup(){
  size(400,400);
  background(0,0,0);
  frameRate(60);
}

float pi=3.141592;
int currentAngle=0;

void draw(){
  int cx,cy,radius; 
  cx=200;
  cy=200;
  radius=190;
  int angle=72;
  
  
   ellipseMode(CENTER);
   fill(255,0,0);
   stroke(255,0,0);
   ellipse(cx,cy,radius*2,radius*2);
  
  int p1x,p2x,p3x,p4x,p5x;
  int p1y,p2y,p3y,p4y,p5y;
  
   for(int i=0; i<15; i++)
   {
    p1x=circleX(cx,radius,currentAngle);  
    p1y=circleY(cy,radius,currentAngle);
      
    p2x=circleX(cx,radius,currentAngle+angle);  
    p2y=circleY(cy,radius,currentAngle+angle);
  
    p3x=circleX(cx,radius,currentAngle+angle*2);  
    p3y=circleY(cy,radius,currentAngle+angle*2);
  
    p4x=circleX(cx,radius,currentAngle+angle*3);  
    p4y=circleY(cy,radius,currentAngle+angle*3);
  
    p5x=circleX(cx,radius,currentAngle+angle*4);  
    p5y=circleY(cy,radius,currentAngle+angle*4);

    stroke(random(255),random(255),random(255));
    line(p1x,p1y,p3x,p3y);
    line(p3x,p3y,p5x,p5y);
    line(p5x,p5y,p2x,p2y);
    line(p2x,p2y,p4x,p4y);
    line(p4x,p4y,p1x,p1y);
    delay(5);
    currentAngle+=5;
   }
}

int circleX(int x, int radius, float angle){
  float radian=pi/180*angle;
  float resultX;
  resultX=x+radius*sin(radian);
  return (int)resultX;
  
}

int circleY(int y, int radius, float angle){
  float radian=pi/180*angle;  
  float resultY=0;
  resultY=y+radius*cos(radian);
  return (int)resultY;
}

