
// Keith O'Hara <kohara@bard.edu>
// Feb 17 2010 Lecture


PFont font1, font2;
void setup()
{
   size(300, 300);
   font1 = loadFont("ComicSansMS-48.vlw");
   font2 = loadFont("Calibri-48.vlw");
   smooth();
}

void draw()
{
  background(0);
  fill(255, 255, 0);
  textFont(font1); 
  textSize(mouseX/5);
  text("time", mouseX, mouseY);
  textFont(font2);
  textSize(second()+10);
  text(nf(hour(), 2) + ":" + nf(minute(), 2) + ":" + nf(second(), 2), 0, height-1);
}

