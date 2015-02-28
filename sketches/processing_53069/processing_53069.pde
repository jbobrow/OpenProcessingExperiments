
//set background size and color
size(250,250);
background(255);
//drawing shapes without outlines
noStroke();
//smooth out edges
smooth();
//draw rectangles using the center, width and height
rectMode(CENTER);
//initial shape colours
fill(50,0,0);
//move origin point to center of screen
translate(125,125);
//loop to draw shapes
//starts x at 255 and decreases x by 1 for each iteration
for(int x=255; x>0;x-=1){
  /*colour of shapes by taking away red and green,
  but adding blue at the same rate*/
  fill(x,x,(255-x));
  //rectangles drawn using center of screen to start, then
  //x value as the height and width to create a square
  rect(0,0,x,x);
  //rotation about the origin at 1.2 Radians
  rotate (1.2);
} 
