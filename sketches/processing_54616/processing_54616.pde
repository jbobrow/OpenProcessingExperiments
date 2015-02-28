
size(250,250);
//size of image
background(255);
//colour of background
smooth ();
//smooth out lines
noStroke();
//no stroke on shape
translate(125,125);
//centre point
rectMode(CENTER);
//the rectangle will be placed at the centre 
fill(50,0,0);
for(int x=180; x>0;x-=10){
//begins at x and when x is greater than 0, 10 will be taken away
  rect(0,0,x,x);
//size of rectangle 
  fill(255-x,0,0);
//colour will be subtracted from 10 each round
  rotate(0.5);
//amount of the rotation of the rectangle
}

  
           
