
//set background size/colour
size(250,250);
background(255);
noStroke();
//rectangles drawn using width and height
rectMode(CENTER);
//initial shape will be a dark red
fill(50,0,0);
//change middle of the image
translate(125,125);
//loop starts at 180 for x, decrementing by 10
for(int x=180; x>0;x-=10){
//colour changes from dark to light red
  fill((x-255)*-1,0,0);
//rectangle size changes with x
  rect(0,0,x,x);
// 0.5 Radius turn 
  rotate (0.5);
}
                    
