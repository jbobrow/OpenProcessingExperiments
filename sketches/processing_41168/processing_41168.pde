
float y = 0.0;
float y2 = 0.0;

PImage img0; PImage img1;

void setup(){
  size(500,500);
  img0=loadImage("earth2b.jpg");
  img1=loadImage("rocket1.png");
}

void draw(){
  image(img0,0,0);
  smooth();
  noStroke();
  ellipse(y,300,7,7);
  ellipse(400,y,7,7);
  ellipse(y2,490,4,4);
  ellipse(300,y2,7,7);
  image(img1,y,y,y,y);
  y += 1.2;
  y2 += 0.9;
  if (y > 500) {
  y = -10;
  }
  if (y2 > 500) {
  y2 = -10;
  }
}

