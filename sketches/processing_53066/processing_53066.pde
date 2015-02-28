
//set background size and colour
size(250,250);
background(255);
//drawing shapes without borders
noStroke();
//rectangles will be drawn from the center point using width and height
rectMode(CENTER);
//initial shape will be a dark red
fill(50,0,0);
//change origin to middle of image
translate(125,125);
//loop to create shapes, starting at 180 for x, decrementing by 10
for(int x=180; x>0;x-=10){
  //colour changes from dark to light red
  fill((x-255)*-1,0,0);
  //rectangle size changes with x
  rect(0,0,x,x);
  //turn as we draw by 0.5 Radians
  rotate (0.5);
} 
