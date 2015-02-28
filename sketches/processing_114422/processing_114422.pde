
PImage a;
PImage b;
PImage c;
PFont header;
PFont date;

void setup() {
  size(800, 500);
  a = loadImage("AA1.gif");
  b = loadImage("AA2.gif");
  c = loadImage("AA3.gif");
  header = loadFont("Telegrafico.vlw");
  stroke(0);
  strokeWeight(1);
  line(30, 70, 770, 70);
}



void draw() {
  background(255, 0, 0);


  float x = mouseX;
  float y = mouseY;

  if (x < 270) {
    image(a, 0, 100);
  }
  else if (x > 270 && x < 470) {
    image(b, 0, 100);
  }

  else {
    image(c, 0, 100);
  }

  text("Njoy Design Studio", 30, 40, 770, 40);
}



