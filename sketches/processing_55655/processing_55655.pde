
//screen size
size(250,250);
//background colour
background(255);
//smooth edges
smooth();
//no stroke on objects
noStroke();
//drawn from center point
rectMode (CENTER);
//moving origin to centre image
translate(125,125);
//loop
//start at 180, greater than 0, decreased by 10
for(int x=180; x>0;x-=10){
//changing colour from dark to light    
  fill((x-255)*-1,0,0);
//changing size of shape
  rect(0,0,x,x);
//changing angle of shape by 0.5
  rotate (0.5);
}
