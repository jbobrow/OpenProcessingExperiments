
PImage img; PImage img1;
float x = 0;

void setup(){
  size(400,300);
  smooth();
  frameRate(60);
  img = loadImage("road.png");
  img1 = loadImage("thunder.png");
}

void draw(){
  tint(#646464,random(0,100));
  image (img,0,0);
  tint(#fff600,x);
  image (img1,0,0);
  x+=1;
}

