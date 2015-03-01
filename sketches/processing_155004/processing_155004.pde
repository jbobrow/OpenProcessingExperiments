
import processing.pdf.*;

int randomSeedNum = 0;
 
float x = 0;
float y = 0;
 
void setup ()
{
  size (600, 200);
  smooth();
}
 
void draw ()
{
  background (#57385c);
  randomSeed (randomSeedNum);
   
  drawAlotEllipse ();
}
 
void drawAlotEllipse ()
{
  int count = 0;
 
  stroke (#57385c);
  strokeWeight (1);
  fill (#ffedbc);
 
  while (count < random (20, 1000))
  {
    x = random (width);
    y = random (height);
 
    drawEllipse ();
     
    count = count + 1;
  }
}
 
void drawEllipse ()
{
  float d = random (10, 100);
  float steps = random (4, 12);
 
  while (d > 1)
  {
    ellipse (x, y, d, d);
    d = d - steps;
  }
}
 
  
void mousePressed ()
{
  if (mouseButton == LEFT)
  {
    randomSeedNum = randomSeedNum + 1;
  }
  else
  {
    randomSeedNum = randomSeedNum - 1;
  }
}

void keyPressed ()
{
  if (key == 's')
  {
    println ("start recording PDF");
    beginRecord (PDF, "PDF_Export/" + timestamp() + ".pdf");
    draw ();
    endRecord ();
    println ("PDF saved");
  }
}

String timestamp ()
{
 return (nf (year(), 4) + nf (month(), 2) + nf (day(), 2) + "_" + nf (hour(), 2) + nf (minute(), 2) + nf (second(), 2));
}
