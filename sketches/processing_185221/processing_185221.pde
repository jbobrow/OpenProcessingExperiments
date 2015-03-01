
/*
An Attempt at Georg Ness's Schotter 
by Jasmine Rajavadee
Feb 10, 2015
*/

int i, u; //cube parameters  
int columns = 32; 
int rows = 15; 

void setup()
{
  size(400, 600); 
  smooth();
  rectMode(CENTER);
  noLoop(); 
  noFill(); 
}

void draw()
{
  background(255); 
  translate(25, 25); 
  for (i = 0; i < columns; i ++)
  {
    for (u = 0; u < rows; u++) 
    {

      pushMatrix(); 
      translate(25*u, 25*i); 
      rotate(random(TWO_PI*i/-360, TWO_PI*i/120));
      rect(0, 0, 25, 25);
      translate(random(25*i), random(25*u)); 
      popMatrix();
    }
  }
}

