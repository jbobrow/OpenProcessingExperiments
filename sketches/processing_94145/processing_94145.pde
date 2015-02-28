
/*Created by Michael Lomuscio
  Rabun Gap - Nacoochee School
  
  Code creates a bouncing ball.
*/


float DirectionX = 1;  //x direction of motion. +1 moves right, -1 moves left.
float DirectionY = 1;  //y direction of motion. +1 moves down, -1 moves up.
float speedX = 10;     //speed in x-direction
float speedY = 15;     //speed in y-direction
float xPos = 100;      //x position of the ball
float yPos = 300;      //y position of the ball
float xRadius = 20;    //x radius of the ball
float yRadius = 20;    // y radius of the ball

void setup(){
 //Initiates size and background color.
 size(600,600);
 background(0); 
}


void draw(){
  background(0);
  fill(255,0,0);
  
  //checks to see if the ball should change its direction in the x direction
  if(xPos <= xRadius){
   DirectionX = 1; 
  } else if(xPos >= width - xRadius){
    DirectionX = -1;
  }
 
  //checks to see if the ball should change its direction in the y direction
  if(yPos <= yRadius){
   DirectionY = 1; 
  } else if(yPos >= height - yRadius){
    DirectionY = -1;
  } 
  
  //draws the ball to the screen
  ellipse(xPos,yPos,xRadius,yRadius);
  
  //moves the ball
  xPos = xPos + DirectionX*speedX;
  yPos = yPos + DirectionY*speedY;
}
