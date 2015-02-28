

PImage img2;
PImage img3;
PImage img4;
PImage img;

void setup() {
  size(400, 400);
  background(255,255,0);
  tint(255, 200);

  img2 = loadImage("prova2.png");
  img3 = loadImage("prova3.png");
  img4 = loadImage("prova4.png");
    img = loadImage("prova1.png");
  smooth();
}

void draw() {
  image(img, 0, 0);
  image(img2, 0, 0, mouseX-50, mouseY-50);
  image(img3, mouseX+50, mouseY+50);

  if (mousePressed) {
    image(img4, mouseX - 200, mouseY);
    tint(255,255,0,50);
  } else {
  tint(255, 50);
}

}


