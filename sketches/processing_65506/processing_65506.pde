
/* 
 'Pinwheel'
 
 Program written for CPSC 601-36
 Assignment 4
 Prepared for Ben Stephenson
 Written by Christopher Sparrow
 2011/11/24

'Pinwheel' is a program which is activated by the 
user through the use of the mouse.
A field of pinwheels are each individually
rotated through the movement of the mouse through 
and within the field.




*/

Pinwheel[][] p; // grid array of Pinwheel p
int rad = 60;   // pinwheel radius variable
int cols = 10;  // # of columns in grid
int rows = 10;  // # of rows in grid

void setup ()
{
  size (600, 600);               //window size
  p = new Pinwheel[cols][rows]; 
  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j ++)
    {
      p[i][j] = new Pinwheel (30+(i * 60),30 + ( j * 60), rad); //initialize each object
    }
  }
}


void draw ()
{
  background (224);

  for (int i = 0; i < cols; i++)
  {
    for (int j = 0; j < rows; j ++)
    {
        p[i][j].update ();           //run the update method
        p[i][j].drawpw ();           //run the drawpw method
    }
  }
}

