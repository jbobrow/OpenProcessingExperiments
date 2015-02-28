
/* 2c-1 by Sarah Sia
York/Sheridan*/
float y = 0.0;	// y position variable

void setup() 
{ 
  size(250, 250); 
  smooth(); 
  fill(0);
}
void draw() 
{ 
  background(#F6FF08);
  ellipse(125, 125, 100, 100); 
  ellipse(125, y, 50, 50); // get y position 
  y += 1; // speed
  if (y > 350){ y = -50.0;
  }
  }

