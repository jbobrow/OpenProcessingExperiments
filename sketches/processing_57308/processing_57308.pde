
//set the screen size
size(250,250);
//set the background colour
background(255);
//moves the orgin to the centre
translate(125,125);
//rectanle will be drawn from the centre point
rectMode(CENTER);
fill(60,0,0);
noStroke();
/*Start x at 180, and as long as x is greater than 0, we will subtract 10*/
for(int x=180; x>0;x-=10){
  rect(0,0,x,x);
  //the change in angle
  rotate(PI/0.6);
  // change the colour where it subtract 10 form R every time.
  fill(255-x,0,0);
}

