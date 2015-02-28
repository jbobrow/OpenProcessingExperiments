
/*
"This is not a clock."
by Roland Schwartz
Inspired by Rene Magritte's "La trahison des images"
*/

PFont font1;

void setup ()
{
  size (500,500);
  smooth();
  font1 = loadFont("BrushScriptMT-48.vlw");
}

void draw ()
{
  println(mouseX);
  println(mouseY);
  background (252,252,125);
  stroke (252,252,125);//everything outline 
  fill (106,198,147);//table color
  rect (30,315,25,185);//legs
  rect (444,315,25,185);
  rect (10,315,479,75);//table top
  
  fill (247,118,42);//clock color
  stroke (57,63,216);//clock outline
  rect (180,180,140,130);//outer clock
  rect (185,310,10,5);//clock feet
  rect (305,310,10,5);
  strokeWeight (10);//face thickness
  ellipse (250,250,100,100);//clock face
  strokeWeight (1);
  
  float s = map(second(), 0, 60, 0, TWO_PI) - HALF_PI;//hands, mathematically
  float m = map(minute(), 0, 60, 0, TWO_PI) - HALF_PI;
  float h = map(hour() % 12, 0, 12, 0, TWO_PI) - HALF_PI;
  line (250,250, cos(s) * 38 + 250, sin(s) *38 + 250);
  line (250,250, cos(m) * 30 + 250, sin(m) * 30 + 250);
  line (250,250, cos(h) * 25 + 250, sin(h) * 25 + 250);
  stroke (252,252,125);//everything outline reapplied
  
  fill (206,62,62); //text
  textFont(font1);
  textAlign(CENTER);
  text ("This is not a clock.", 250,50);
  
  stroke (208,30,30);//wire hanger
  noFill();
  triangle (110, 75, 70, 105, 150, 105);
  
  noStroke(); //nail
  fill(193,189,189);
  ellipse (110,78, 5, 5);
  
  fill (108,30,30); //portrait and frame
  rect (65, 100, 90, 90); 
  PImage img;
  img = loadImage ("self portrait.png");
  image (img, 70, 105, 80, 80);
}
  

