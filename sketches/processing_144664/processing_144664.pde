
// Samantha Chiu 2014
// hw 10


String [] dataStrings;

float XX,y, dx, dy, YY;
 
void setup()
{
  size (600, 400);
  textSize (24);
  
  dataStrings = loadStrings ("text2.txt");
}
 
void draw()
{
  background (95, 219,212);
  printText();
 moveWords();
}
 
void printText ()
{
  fill (0);
  for (int i = 0; i< dataStrings.length; i++)
  {
    text (dataStrings [i], XX, 20*i);
  }
}


void moveWords()
{
 XX+=dx;
 if (XX<width)
 {dx=100;}
 if (XX>0)
 {dx=-100;}
 if (YY<height)
 {dy=-100;}
 if (YY>0)
 {dy=-100;}
}


void keyPressed()
{
  if (key == ' ')
  {
    background(random(255),random(255), random(255));
  }
  else
  {
    exit ();
  }
}
 
void mousePressed ()
{
  textSize(random(29));
}



