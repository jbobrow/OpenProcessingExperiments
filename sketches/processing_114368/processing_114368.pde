
PImage plane;
PImage plane_2;
PImage plane_3;

float x,y;
float r;
float xspeed,yspeed;



void setup() {
  size(500,500);
  smooth();
  plane = loadImage("plane.png");
  plane_2 = loadImage("plane_2.png");
  plane_3 = loadImage("plane_3.png");
  imageMode(CENTER);
  
  randomSeed(0);
  
  x=width/2;
  y=height/2;
  r=250;
  xspeed=-3;
  yspeed=-3;
}

void draw() {
  background(255,209,232);
  
  x=x+xspeed;
  y=y+yspeed;
  
  if(x<-r) {
    x=width+r;
    y=random(height);
  }
  
  if(y<-r) {
    x=height+r;
    y=random(width);
  }
  
  image(plane, x-300,y,r,r);
  image(plane_2,y+200,x+50,r,r);
  image(plane_3, x-100,y/2,r,r);
  
}


