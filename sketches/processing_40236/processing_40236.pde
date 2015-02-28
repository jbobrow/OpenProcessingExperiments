
PFont font;
String a = "nothing";
String b = "gold";
String c = "can stay";

void setup() {
  size(500, 500);
  fill(0);
  smooth();
  font = loadFont("helvetica.vlw");
  noCursor();
}

void draw() {
  background(255, map(mouseY, height/2, height, 215, 255), map(mouseY, 0, height, 0, 255));
  for (float x = 0; x< width; x = x+155)
  { 
    for (float y = 0; y-10 < height; y= y+20)
    {
      textFont(font, 16);
      text(a, x, y);
      fill(255, map(mouseY, height/2, height, 255, 175), map(mouseY, 0, height, 255, 0), map(mouseY, 0, height, 0, 255));
      text(b, x+57, y);
      fill(0);
      text(c, x+92, y);
    }
  }
}

