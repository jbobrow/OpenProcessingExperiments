
PImage img;
PImage cloud;

void setup(){
  size (500,500);
  background (0);
  img = loadImage ("joana.jpg");
  cloud = loadImage ("cloud.jpg");
  frameRate (5);
  imageMode (CENTER);
}

void draw (){
  tint (random(100),random(100),random(100),80);                       
  image (img, random(width), random(height));
  tint (random(255),random(255),random(255),20);
  image (cloud, random(width), random(height));
}

