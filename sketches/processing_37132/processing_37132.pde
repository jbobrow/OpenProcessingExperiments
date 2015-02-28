
PImage bg;

void setup()
{
size (450, 300);
  background(255);
  bg = loadImage("hair_smile.jpg");
  image(bg, 0, 0);
    }
 
int r = 300;
int g = 120;
int b = 100;   
 
void draw() {


  if (mouseX < 250) {
   r = 50;
   g = 120;
   b = 200;
   
  
  }
  else {
    r = 200;
    g = 100;
    b  = 60;
  }
  smooth ();
  noStroke();
  fill(r,g,b);
  ellipse(196, 100, 55, 55);
   fill(r,g,b);
  ellipse(266, 100, 55, 55);
  fill(0);
  ellipse(196, 100, 18, 18);
  fill(0);
  ellipse(266, 100, 15, 15);
   fill(255);
  ellipse(186, 90, 20, 20);
  fill(255);
  ellipse(256, 90, 20, 20);
}


