
/*YSDN 2012, Shannon Gibbs*/ 

size(250,250);
smooth();
background (255);
translate(125,125);
//Size of sketch is 250 x 250
//Edges are smooth
//Background is white
//Point of reference is 125, 125 from 0,0

rectMode(CENTER);
fill(0,90,0);
noStroke();
//Rectangle, moved from center point
// Fill = RGB, 90=green
//No stroke on shapes

for(int x=180; x>0;x=x-10){
  rect(0,0,x,x);
  rotate(PI/14);
  fill(0,260-x,0);
//Size of rectangle decreases
//Rectangle rotates
//RGB = Green value increases every time x changes
}






