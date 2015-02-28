
PImage img;
PImage img2;

void setup(){
  size(800, 400);
  img = loadImage("Background.jpg");
  img2 = loadImage("House.gif");
}

void draw(){
  image(img, 0, 0);
  image(img2, 600, 200);
  image(img2, 700, 188);
}


