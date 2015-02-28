
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
//x begins at 130, is greater than -10, and decreases by 1
for(int x=130;x>-10;x-=1) {
  //change the colour from dark to light 
  fill((x-255)*-1,10,150);
  //change the size of the shape
  rect(10,25,x,x);
  //rotate the shape by 200
  rotate(200);
}  

                
                
