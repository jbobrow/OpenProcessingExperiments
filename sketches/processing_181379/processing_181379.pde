
//Sakamoto Ren
//Breathing Flower
int a = 0;
int h=0;
int b=80;
float x;
float y;

void setup(){
  size(400,400);
  background(0);
  frameRate(50);
  colorMode(HSB,360,100,100);
  smooth();
}

void draw(){
  a+=50;
  h+=2;
  
  if(h>360){
    h=0;
  }

  x = -(width/2)*cos(radians(a));
  y = (height/2)*sin(radians(a));
  translate(width/2,height/2);
  fill(h,100,b,30);
  noStroke();
  ellipse(x,y,height/2,width/2);
  
  if(frameCount>30000){
    b--;
  }
}


