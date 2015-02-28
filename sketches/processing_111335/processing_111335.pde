


PImage img;

void setup() {
  size (600, 840);
  img=loadImage("samurai.png");
}


void draw() {
  background(0);
  image(img, 0, 0, mouseX * 2, mouseY * 2);
}

  
  






