
PImage img, img2;

void setup() {
  size(450,400);
  img = loadImage("smiley_2.jpg");
  img2 = loadImage("smiley_1.jpg");
}

void draw() {
  if (keyPressed) {
    if (key == CODED) {
    if (keyCode == UP) 
      image(img2,0,0);
    }
  } else {
    image(img,0,0);
  }
}



