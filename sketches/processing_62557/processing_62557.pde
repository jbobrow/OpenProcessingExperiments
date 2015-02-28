
PImage img1;
PImage img2;
PImage img3;
PImage img4;

void setup() {
  smooth();

  size(340, 488);
  
  img1 = loadImage("bild4.jpg");
  img2 = loadImage("bild2.png");
  img3 = loadImage("bild1.png");
  img4 = loadImage("bild3.jpg");
}

void draw() {

  image(img4, 0, 0);

  if (mousePressed) {
    image(img1, 0, 0);
    image(img2, mouseX, mouseY);
  }
  else {
    image(img3, mouseX, mouseY);
  }
}


