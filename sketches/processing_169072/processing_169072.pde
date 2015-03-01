
PFont font;

void setup()
{
  size(600, 600);
  font = loadFont("Seravek-BoldItalic-48.vlw");
  textFont(font);
  colorMode(HSB, 360, 100, 100);
}

void draw()
{
  background(0);
  String s = "WELCOME";

  float sz = random(10, 300);
  float x = random(0, width);
  float y = random(0, height);

  if (mousePressed)
  {
    int substrbegin = (int)random(0, s.length()-1);
    int substrend = (int)random(substrbegin+1, s.length()-1);

    textSize(sz);
    fill(mouseX*360/width, mouseY*100/height, 100);
    text(s.substring(substrbegin, substrend), x, y);
  } else
  {
    textSize(20);
    fill(255);
    text(s+" Press your mouse", width/2, height/2);
  }
}
