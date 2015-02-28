
size(250,250);
background(255);

//this determines the center point
translate(125,125);
//the shape will be created based from the center
rectMode(CENTER);
fill(60,0,0);
noStroke();
//The starting point is at x which is 180. 
//When the x is greater than 0, it will subtract 10 from it
for(int x=180; x>0;x-=10){
  rect(0,0,x,x);
  //colour will be subtracted from 10 each round
  fill(255-x,0,0);
  //the rotation of the rectangle
  rotate(PI/0.6);
}
 
                


