
PFont font;
int xPos = 50;
int yPos = 60;
int direction= 2;

void setup () {
  size(600, 100);

  font = createFont ("Times", 50);
  textFont (font);
}

void draw() {
  background (0);
  
  text ("MADAM, I'M ADAM", xPos, yPos);

  xPos = xPos + direction;
  if (xPos>150 || xPos<0) {
    direction=-direction;
  }
}
