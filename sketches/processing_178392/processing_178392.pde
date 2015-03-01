
PImage vegetacion;
color[] palette = {#A0EDEF, #65E5E0, #D0F2F1, #E3F7EF, #87D2CE, #8EC0CC};

void setup () {
  size(800, 600);
  vegetacion = loadImage("vegetacion.png");
  background(0);
}

void draw() {
  image(vegetacion, 0, 0);
  float r = random(5,50);
  float s = random(1,2);
  float l = random(0,5);
  if (mousePressed) {
    strokeWeight(s);
    stroke(palette[int(l)]);
  } else {
    strokeWeight(s);
    stroke(palette[int(l)]);
  }
  line(mouseX, mouseY-r, mouseX, mouseY+r);
}


