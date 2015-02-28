
PImage littleman; 
PImage mrabbit;
PImage boy_left;
PImage boy_right;
PImage boy_left_bottom;
PImage boy_right_bottom;
PImage boy_center;
PImage cloud1;
PImage cloud2;
PImage toy_right;
int numBalls = 1;
float spring = 0.01;
float gravity = -0.3;
float friction = -1;
Ball[] balls = new Ball[numBalls];
int mX;
int mY;
int cloudx1=-100;
int cloudx2=-500;
int cloudx3=-800;
int cy1,cy2,cy3;
void setup() 
{
  size(1000, 640);
  noStroke();
  smooth();
  for (int i = 0; i < numBalls; i++) {
    balls[i] = new Ball(random(width), random(height), 90, i, balls);
  }
  littleman=loadImage("littleman.png");  
  mrabbit=loadImage("mrabbit.png");
  boy_left=loadImage("boy_half.png");  
  boy_right=loadImage("boy_half_right.png");
  boy_center=loadImage("boy_half_center.png");
  cloud1=loadImage("cloud1.png");
  cloud2=loadImage("cloud2.png");
  boy_left_bottom=loadImage("boy_half_left_bottom.png");
  boy_right_bottom=loadImage("boy_half_right_bottom.png");
  toy_right=loadImage("airplane_right.png");
  frameRate(40);
  cy1=(int)random(0,25);
  cy2=(int)random(100,150);
  cy3=(int)random(0,15);
}

void draw() 
{
  background(183,224,255);
  image(cloud1,cloudx1,cy1);
  image(cloud2,cloudx2,cy2);
  image(cloud1,cloudx3,cy3);
  cloud(cy1,cy2,cy3);
  if(mouseX<500 && mouseY<300)
  {
  image(boy_left,200,250);
  }
  else if(mouseX<200 && mouseY>300)
  {
    image(boy_left_bottom,200,250);
  }
  else if(mouseX >600 && mouseY>300)
  {
    image(boy_right_bottom,180,250);
  }
  else if(mouseX>150 && mouseX< 600 && mouseY>300)
  {
    image(boy_center,200,250);
  }
  else{
    image(boy_right,200,250);
  }


  for (int i = 0; i < numBalls; i++) 
  {
    balls[i].move();
    balls[i].display();  
  }
}

void cloud(int cy1,int cy2, int cy3){
  cloudx1++;
  cloudx2++;
  cloudx3++;
    if(cloudx1>1000)
    {
      cloudx1=0;
        cy1=(int)random(0,25);

    }
    if(cloudx2>1000)
    {
      cloudx2=0;
        cy2=(int)random(100,150);

    }
        if(cloudx3>1000)
    {
      cloudx3=0;
        cy3=(int)random(0,15);
    }
}
class Ball {
  float x, y;
  float diameter;
  float vx = 0;
  float vy = 0;
  int id;
  Ball[] others;
 
  Ball(float xin, float yin, float din, int idin, Ball[] oin) {
    x = xin;
    y = yin;
    diameter = din;
    id = idin;
    others = oin;
  } 
  
  void move() {
    mX = mouseX;
    mY = mouseY;
    float angle = atan2(y-mY, x-mX);
    vx += gravity * cos(angle);
    vy += gravity * sin(angle);
    if(vx > 8){
      vx = 8;
    }
    else if(vx < -8){
      vx = -8;
    }
    if(vy > 8){
      vy = 8;
    }
    else if(vy < -8){
      vy = -8;
    }    
    x += vx;
    y += vy;
  }
  void display() {
    image(toy_right,x, y,diameter,diameter);
  }
}


