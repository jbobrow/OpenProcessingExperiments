
/* An e-card in which a message written 
in background colour can be revealed. */

void setup ()
{
  size (500, 500);
  background (0);
  noStroke ();
  noCursor ();
  textSize (24);
  fill (255); // Text on the initial screen
  text ("Move cursor across", 150, 410);
}

void draw ()
{
  fill (0); // Draws the labyrinth 
  rect (10, 0, 490, 70);
  rect (0, 80, 490, 70);
  rect (0, 150, 245, 80);
  rect (255, 160, 245, 80);
  rect (0, 230, 100, 90);
  rect (110, 240, 390, 70);
  rect (0,320, 390, 70);
  rect (400, 310, 100, 80);
  rect (0, 390, 70, 110);
  rect (430, 390, 70, 110);
  textSize (48); // Text to be revealed
  text ("Find your way", 85, 450);
  fill (255);
  ellipse (mouseX, mouseY, 30, 30);
  }
  


