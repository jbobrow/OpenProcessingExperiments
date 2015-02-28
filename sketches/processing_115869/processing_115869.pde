
import netscape.javascript.*;

PImage[] img = new PImage[20];
PImage img1, img2; 
int copy = 50; 
float angle = 0; 


void setup() {
  size(700, 700); 
  background(0);
  for (int i = 0; i < 20; i ++) {
    img[i] = loadImage(i+".png");
  }

  img1 = loadImage("21.png");
  img2 = loadImage("22.png");
}


void draw() {
  image(img1, random(0, 500), random(0, 500), 100, 100);

  image(img2, mouseX - 100, mouseY - 100, 300, 300);

  float r = random(0, 700); 
  for (int i = 0; i < 20; i ++) {
    rotate(angle);
    image(img[i], r, copy*i, 10, 100);
  }

  for (int i = 0; i < 20; i ++) {
    rotate(angle);
    image(img[i], copy*i, r, 10, 100);
  }

  angle += 0.1;
}



void keyPressed() {
  saveFrame("image_####.png");
}


