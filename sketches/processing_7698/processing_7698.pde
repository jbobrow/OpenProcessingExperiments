
// Keith O'Hara <kohara@bard.edu>=
// Feb 17 2010 Lecture

String msg = "";
PFont font;

void setup()
{
   size(800, 200);
   font = loadFont("Calibri-48.vlw");
   textFont(font);
   smooth();
}

void keyPressed()
{
  msg = msg + key;
}

void draw()
{
  background(0);
  fill(255, 255, 0);
  textAlign(LEFT, TOP);
  text(msg, mouseX, mouseY); 
}

