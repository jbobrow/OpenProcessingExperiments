
/*-----------------------------
Falling Boxes
Boxes progressively rotate to randomness

Created February 7, 2015
By Lauren Alman
contact alman.5@osu.edu
Modified February 9, 2015

project URL
-----------------------------*/

void setup() 
{  
  //size of canvas
  size(500, 750); 
  //black background 
  background(10); 
  //makes the boxes smooth (not as pixilated when rotated)
  smooth();  
  //does not continue to rotate and translate the boxes
  noLoop();
  //make the boxes have no fill
  noFill();
}

//want 12 columns constrained by rows
int rows = 12;
//want 22 rows constrained by the columns
int columns = 22;
//size of the boxes sides (x and y)
int s = 30;

void draw() 
{    
  for (int i = 0; i<rows ; i++) 
  {    
    for (int j = 0; j<columns; j++) 
    {      
      //made the stroke color random so it is cool when you take noLoop out
      stroke(random(100,255));
      //store the original position of the top set of square
      pushMatrix();            
      //create new x position for the square (70=space from side edges of canvas)
      float x = 70 + i*s + (random(-0.5*j, 0.5*j));      
      //create new y position of the square (50=space from top edge of canvas)
      float y = 50 + j*s + (random(-0.5*j, 0.5*j));      
      //displaces the square to new x and y coords
      translate(x, y);        
      //have to create float for radians or degrees to work
      float R = random(-j, j);
      //random rotation based on how far down the squares are (lower down the more rotated, radians creates more of a constraint because it is a smaller number)
      rotate(radians(R));        
      //draws the square (start at x1 and y1 = 0 
      rect(0, 0, s, s); 
      //create rectangle with respect to how the original top squares were (keeps from tilting off page)     
      popMatrix();
    }
  }
}
