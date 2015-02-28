


//fly variables
int flyX = 250;
int flyY = 160;
int flyW = 10;
int flyH = 15;

void setup() {
size(500,375);
PImage b;
b = loadImage("pie.jpg");
image(b, 0, 0);
}

void draw() {
  smooth();
  ellipseMode(CORNER);
  if (mouseX > flyX && mouseX < flyX+flyW && mouseY > flyY && mouseY < flyY+flyH) {

    fill(255);
    ellipse(flyX-6,flyY,9,9);
    ellipse(flyX+6,flyY,9,9);
    fill(0);
    ellipse(flyX+random(-250,250),flyY+random(-160,215),flyW,flyH);
  }
  fill(255);
  ellipse(flyX-6,flyY,9,9);
  ellipse(flyX+6,flyY,9,9);
  fill(0);
  ellipse(flyX,flyY,flyW,flyH);
}

