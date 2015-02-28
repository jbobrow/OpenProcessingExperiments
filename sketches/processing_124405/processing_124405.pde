
PImage bild;

int modi = 1;

void setup() {
  size(640, 480);
  bild = loadImage("pilze.jpg");
  background(255);
}

void draw() {
  //image(bild,0,0);

      for (int i = 0; i<30;i++) {
        int x = mouseX+int(random(- 25, 25));
        int y = mouseY+int(random(- 25, 25));
        fill(bild.get(x, y));
        noStroke();
        ellipse(x, y, random(5, 25), random(5, 25));
      }
  if (mousePressed) {
    if (modi==1) {
      for (int i = 0; i<30;i++) {
        int x = mouseX+int(random(- 25, 25));
        int y = mouseY+int(random(- 25, 25));
        fill(bild.get(x, y));
        noStroke();
        rect(x, y, random(5, 25), random(5, 25));
      }
    }
  }
}



