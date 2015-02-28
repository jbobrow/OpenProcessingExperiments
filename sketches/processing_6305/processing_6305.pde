
//red component of the fill color
int fillR=0;
int rate=5;
int inc=1;

void setup()


{
  //make sketch size 160pxby 120px
  size(160,120);
  //clear the screen to black
  background(0);
}

void draw()
{
  fillR = fillR+inc;
  rate=mouseY;
  
  // it's a question 
  //if so , set inc to -1
  println (fillR);

  if(fillR>=255)
  {
    fillR=255;
    inc=-rate;
  }


  if(fillR<=0)
  {
    fillR= 0;
    inc= rate;
  }

  smooth();
  stroke(56,222,43);
  fill(0,fillR,0);
  ellipse(width/2,height/2,width/3,height/3);
}


