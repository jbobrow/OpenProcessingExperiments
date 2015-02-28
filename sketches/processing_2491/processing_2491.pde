
/**
 taken and modified from the distance 2D example
 
 sean_velasco@hotmail.com
 june 2009
 
 */
 
drop one = new drop();


void setup() {
  size(800, 600); 
  smooth();
  noStroke();
  
  one.x = 400;
  one.y = 0;


}

void draw() 
{
  
  one.drip();

 
};

