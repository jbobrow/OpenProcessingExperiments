
final float MAXMOUTH=PI/4;
float mouthSize=PI/6;
float pacX =100;
float pacY;
float velocity;
float pacSize;
float x1, y1;
float angle;

boolean dot;

boolean closing=true;

void setup() {
  size(1000, 1000);
  velocity=5;
  pacY=height/2;
  background(0);
  fill(255, 255, 0);
  //arc(100,height/2,200,200,mouthSize,2*PI-mouthSize);
  pacSize=50;

  dot=true;
  strokeWeight(10);
  stroke(255, 255, 255);
  x1=random(15, width - 15);
  y1=random(15, height - 15);
  point(x1, y1);
}
void draw() {

  if (closing) {
    mouthSize-=.1;
    if (mouthSize <=0) {
      closing=false;
    }
  } else
  {
    mouthSize+=.1;
    if (mouthSize >= MAXMOUTH)
      closing=true;
  }
  
  angle=get_angle(mouseX, mouseY, pacX, pacY);
  pacX+= get_movement_x(angle, velocity);
  pacY+= get_movement_y(angle, velocity);


  if (!dot) {
    dot=true;

    x1=random(15, width - 15);
    y1=random(15, height - 15);
  }

  if(dist(pacX,pacY,x1,y1)<=pacSize/2)
  {
    dot=false;
    pacSize+=10;
    velocity++;
  }



  background(0);


  stroke(0, 0, 0);

  fill(255, 255, 0);
  arc(pacX, pacY, pacSize, pacSize, mouthSize+angle-PI, PI-mouthSize +angle);
  strokeWeight(10);
  stroke(255, 255, 255);
  point(x1, y1);
  
  
}


float get_angle(float a1, float a2, float b1, float b2) {
  //'''Location A is player position and locationB is where the pacman is'''
  float tempx1=a1;
  float tempy1=a2;
  float x2=b1-tempx1;
  float y2=b2-tempy1;
  float x1=0;
  float y1=0;
  float rawAngle=atan2(y2, x2);
  float distance=0;
  float angle=rawAngle;
  return angle;
}
float get_movement_x(float theta, float speed) {
  float x=cos(theta)*speed;
  float speedx=-x;
  return speedx;
}
float get_movement_y(float theta, float  speed) {
  float y=sin(theta)*speed;
  float speedy=-y;
  stroke(255);
  text(speedy, 20, 20);
  return speedy;
}
