
PImage img0; PImage img1; PImage img2; PImage img3;

float y = 0.0;
float y2 = 0.0;

void setup() { 
  size(500,500); 
  img0 = loadImage("forest.png");
  img1 = loadImage("horseman.png");
  img2 = loadImage("icabod.png");
  img3 = loadImage("pumpkin.png");
}
  

void draw() { 
  background(204);
 image(img0,0,0); 
  image(img1, 40, 250, 148, 146);
  image(img2, 300, 300, 167, 206);
  image(img3, 120, 200, y, y);
  y -=- 12.5;
  if (y > 650){
    y = 40;
  }

}

