

void setup( )
{
  size(400, 75);  // Makes the void have a width of 400 pixels and a height of 75 pixels
  background(200);  // Makes the background grey
  smooth();
}
float value =25;
void draw() {
  value=constrain(map(mouseX,55,355,0,100),0,100); 
  stroke(#0530FF); // Makes the rectangle have a blue boarder
  fill(0); // Fills/makes the rectangle black 
  rect(55, 25, 300, 25); // This draws the rectangle at 55 pixels across, 25 pixels down. (has width of 300 pixels and a hieght of 25 pixels)  
  fill(lerpColor(#ff0000, #00ff00, value/100));  // Changes the fill from a bright red to a green the more right the mouse goes along to the right of the screen (In the middle is causes the fill to become a brownish  colour)
  rect(56,26,map(value,0,100,0,298), 23);
}



