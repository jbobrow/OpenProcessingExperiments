
//hans petersen
//mash left and right arrow key to make it dance


int strobe = 0;

void setup()
{
 
size(500,500);size (500,500);
}

void draw()
{
 

  background(strobe);
textSize(32);
text("dance", 10, 30); 
fill(0, 102, 153);
text("dance", 10, 60);
fill(0, 142, 153, 51);
text("dance", 10, 90);
  //body
  noStroke();
  //head/neck
 fill(#FFCE62);
 rect(240,185,15,45);
  ellipse(245,175,55,55);
  
 

  //leg1
  fill(#002FD3);
  rect(233,320,-90,-10);
  rect(150,310,-10,90);
  //leg2
  rect(253,310,90,10);
  rect(353,400,-10,-90);

  
  if (keyPressed && strobe == 0) {
    strobe = 255; }
    else {strobe = 0;}
    
  if (key==CODED && keyCode==LEFT)  {  
    //arm1
    fill(#FFCE62);
  rect(100,230,300,10);
  rect(100,230,10,-50);
   //arm2
  rect(400,230,10,50);}
  
else{  //arm1
   fill(#FFCE62);
  rect(100,230,300,10);
  rect(100,230,-10,50);
  
  //arm2
  rect(400,230,-10,-50);
}
   

    //body
 fill(#FF0303);
  rect(233,230,30,90);
  rect(150,230,200,10);
  
}
