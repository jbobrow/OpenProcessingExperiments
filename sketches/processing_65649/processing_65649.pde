
PImage Maus1;
PImage Kaese;
PImage Maus2;
PImage Maus3;

void setup () {
  size (600, 600);


  Maus1 = loadImage ("Maus1.jpg");
  Kaese = loadImage ("Kaese.jpg");
  Maus2 = loadImage ("Maus2.jpg");
  Maus3 = loadImage ("Maus3.jpg");
}
void draw () {

  image (Kaese, 0, 0, width, height);

  if (mouseX > 0) {
    image (Maus1, mouseX, mouseY);

    if (mousePressed) { 
      image (Maus2, mouseX, mouseY);
    }
    if (keyPressed) { 
      image (Maus3, 0, 0, width, height);
    }
  }
}
