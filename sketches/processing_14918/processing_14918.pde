
 //declare the variable and give it a starting value
int xPosition = 0;
int speed = 1;

void setup(){
  size(400,400);
}

void draw(){
  background(0);
  fill(255,0,0);
  
  //draw a rectangle using the variable for the x position
  fill(#ff0000); // set color to red
  rect(xPosition,100,50,50);
  
    //draw a second shape using the variable for the x position divided by two, and centered on screen
    fill(#00ff00);// set color to green
    ellipse(xPosition/2+100,250,30,30);
    
  //change the value of xPosition
  xPosition = xPosition + speed;
  
  //now check if we have reached the edge of the window
  if (xPosition > width-50){
    speed = speed * -1;
  } else if (xPosition < 0){
    speed = speed * -1;
  } 
}

