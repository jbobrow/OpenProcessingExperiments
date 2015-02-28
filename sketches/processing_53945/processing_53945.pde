
//position of the y variable (where the shape starts)
float y = 125.0; 
void setup()
{
//size of the screen
size(250, 250);
//background colour
background (255);
smooth();
}
void draw() {
//shape begins in the middle of the screen. y=125 x=125
  translate(125,125);
//white background
  background(#FFFFFF);
  noStroke();

//circle rotates at 0.9
  rotate(PI/0.9);
//position of the circle
  ellipse(0,0,y,y);
//completely figured this out by accident! By subtracting y, the colour changes during transition
  fill(124-y,45,255);
  

//once y becomes greater than 125, the shape will repeat and set back to 0
  if (y>250){
  y=0.0;
//if not, the y will continue to grow at a rate of 0.9 
  }else{
   y+= 0.9; 
  }
}
        
                
