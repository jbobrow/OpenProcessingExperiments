

// This is what I understand by dynamic drawing.
// In this artwork I used the logarithmic spiral parametric 
// equation. More information may be found here:
// http://mathworld.wolfram.com/LogarithmicSpiral.html
// So, how is this possible? Each individual circle goes 
// from dark to bright and back to dark again. When these 
// elements are repeated over and over, the pattern triggers 
// the motion detectors in the brain. When these detectors 
// are triggered you are about to see motion, whether it's 
// present or not. :)

// I completed this Coursera Course before this one:
// https://www.coursera.org/records/euMnBmPBDu59cqFf

// Variables
int i = 0;
int a = 40;
float b = 1.5;

//Define Color Palette
color[] pallete = {#FFFFFF, #000000, color(1, 102, 255),color(210, 210, 0)};

//Create setup code block
void setup()
{
  size(800, 600);
  smooth();
  noStroke();
  frameRate(30);
}

//Create the draw code block
void draw()
{
  background(pallete[3]);
  translate (width/2, height/2);
  // spiral
  for (int i=0; i<30; i++)
  {
    rotate(TWO_PI/30);
    for (float theta = 0; theta < TWO_PI; theta = theta + PI/30)
    {
      float r = a * exp(b*theta);
      float x  = r * cos (theta);
      float y  = r * sin (theta);
      // bright
      fill(pallete[0]);
      arc(x, y, r/7, r/7, -PI/2, PI/2);
      // dark
      fill(pallete[1]);
      arc(x, y, r/7, r/7, PI/2, 3*TWO_PI/4);
      // inner blue
      fill(pallete[2]);
      ellipse (x, y, r/10, r/10);
    }
  }
  noLoop();
}



