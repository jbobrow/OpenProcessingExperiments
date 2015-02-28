
//set the screen size
size(250,250);
//set the background colour
background(255);
//moves the orgin to centre of image
translate(125,125);
// rectangle will be drawn fromt the centre point
rectMode(CENTER);
noStroke();
/*Start x at 180, and as long as x is greater than 0, we will subtract 10*/
for(int x=180; x>0;x-=10){
  rect(0,0,x,x,180,180);
   //this change the angle 
  rotate(PI/0.6);
    //change the colour of the shape where it will subtract 10 every time from G
  fill(0,255-x,189);
}

