
// y position variable
float y = 0.0;	
void setup() 
{
//size of the screen
size(250, 250);
//background colour
background (255);
smooth();
}
void draw() {
//moves the origin to the centre of the image
  translate(125,125);
//rectangle will be drawn from the centre point
  rectMode(CENTER);
  background(255);
  noStroke();
//drawn a rectangle where it rotate at 0.5 and the two y in the rectangle add up 5 every time, with the G colour subtracting 5 every time.  
  rotate(PI/0.5);
  rect(0,0,y,y,160,130);
  fill(255,255-y,112);
//drawn a rectangle where it rotate at 0.6 and the two y in the rectangle add up 5 every time, with the R colour subtracting 5 every time.    
  rotate(PI/0.6);
  rect(0,0,100,100,y,y);
  fill(255-y,255,255);
//drawn a rectangle where it rotate at 0.8 and the two y in the rectangle add up 5 every time, with the B colour subtracting 5 every time.  
  rotate(PI/0.8);
  rect(0,0,50,50,y,y);
   fill(255,255,255-y);
// add 0.5 to y    
  y += 0.5;
// if position is more than 500
if (y > 550){ 
// set it to -50
  y = -50.0;
}
}

