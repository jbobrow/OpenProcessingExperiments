
PImage real;
PImage real2;
PImage real3;

void setup(){
  size(300,300);
  real=loadImage("real.JPG");
  real2=loadImage("real2.JPG");
  real3=loadImage("real3.JPG");
}

void draw(){
  image(real2,0,0);
  tint(255,255,255,200);
  image(real3,0,0);
  tint(255,255,255,110);
  image(real,0,0);
  tint(255,255,255,90);
}

