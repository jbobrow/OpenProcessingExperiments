
PImage skull;
PImage crucifix;
float xPoscross1;
float yPoscross1;
float xPoscross2;
float yPoscross2;

void setup() {
  size(370, 550);
  background(80);
  smooth();
  crucifix = loadImage("crucifix.png");
  skull = loadImage("skull.jpg");
}

void draw() {
  noCursor();
  background(80);
  image(skull, 0, 0);
  image(crucifix, xPoscross1, yPoscross1);
  image(crucifix, xPoscross2, yPoscross2);

  xPoscross1 = constrain(mouseX, 65, 110);
  yPoscross1 = constrain(mouseY, 197, 215);
  xPoscross2 = constrain(mouseX, 214, 252);
  yPoscross2 = constrain(mouseY, 195, 222);
}
void mousePressed() {
  image(crucifix, 160,100);
}


