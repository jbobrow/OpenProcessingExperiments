
/* A little sketch that reveals a message in background
colour through fixed triangles; redscale */

int a; // controls the hue of the triangles

void setup ()
{
  size (500, 500);
  background (0);
  noStroke ();
  a = 100;
  textSize (24); // text for the start screen 
  fill (255);
  text ("Move cursor across", 125, 375);
  text ("Click left to change colour", 100, 400);
  text ("Click right to start", 125, 350);
  }

void draw ()
{
  if (mousePressed  && (mouseButton == LEFT))
  {
      a--;
  }
   colorMode (HSB, 100);
   fill (a, 75, 100, 25); 
  triangle (mouseX, mouseY, 500,225, 500, 275); 
  if (a == 75) // hue set only to work in hues of red
  {
    a = 100;
  }
  textSize (72); // text to be revealed
  fill (0);
  text ("Spread", 165, 175);
  text ("some", 175, 250);
  text ("love", 175, 325); 
  if (mousePressed  && (mouseButton == RIGHT))
  {
    fill (0);
    rect (0,0,600,600);
  }
  }

  


