
PFont myFont;
String[] lines;
int index = 0;
int quoteindex = 0;

void setup() {
  size(640, 60);
  background(255);
  smooth();
  // read in a file with quotes
  frameRate(50);
  lines = loadStrings("quotes.txt");
  myFont = createFont("TrebuchetMS", 20);
  textFont(myFont);
  fill(255,0,0);
}

void draw() {
  if (index >= 120)
  {
     index -= 90;
     quoteindex += 1;
  }
  if (quoteindex >= lines.length)
  {
    quoteindex = 0;
  }
  background(255);
  text(lines[quoteindex], 10, 90-index, 620, 60);
   index += 1;
}


