
//set background size
size(250,250);
//set background colour
background(255);
//no stroke on borders
noStroke();
//smooth edges
smooth();
//draw rectangles from the center point
rectMode(CENTER);
//moves the origin to the middle
translate(125,125);

//loop to create the shapes
//x begins at 180, is greater than 0, and decreases by 10
for(int x=180;x>0;x-=10) {
  //change the colour from dark to light red
  fill((x-255)*-1,0,0);
  //change the size of the shape
  rect(0,0,x,x);
  //rotate the shape by 0.5
  rotate(0.5);
}  
                
                                
