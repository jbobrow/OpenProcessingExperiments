
// hw 3/11/14
// data input


PFont myFont;

void setup() {
  size(400,400);
  background(255);
  myFont = createFont("Courier New", 32);
  textFont(myFont);
}

void draw() {
  String lines[] = loadStrings("text.txt");
  for (int i = 0 ; i < lines.length; i++) {
    fill(random(0,255));
    text(lines[i],random(0,400),random(0,400));
  }
}


