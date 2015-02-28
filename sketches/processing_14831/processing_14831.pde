
//declare the variable and give it a starting value
int xPosition = 300;
int speed = 2;
int mysize = 50;
void setup(){
  size(400,400);
}

void draw(){
  background(132,222,167);
  fill(26,109,116, 120);
  
  //draw a rectangle using the variable for the x position
 ellipse(xPosition,24,mysize,mysize);
 ellipse(18,xPosition,mysize,mysize);
 ellipse(xPosition,300,mysize,mysize);
 ellipse(123,xPosition,mysize,mysize);
  ellipse(xPosition,5,mysize,mysize);
 ellipse(35,xPosition,mysize,mysize);
 ellipse(xPosition,255,mysize,mysize);

  //change the value of xPosition
  xPosition = xPosition + speed;
  mysize = mysize + speed;
  //now check if we have reached the edge of the window
  if (xPosition > width){
    speed = speed * -1;
  } else if (xPosition < 0){
    speed = speed * -1;
  } 
}


