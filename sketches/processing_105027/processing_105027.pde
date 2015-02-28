
float xPos=random(0,width);
float yPos=random(0,height);
// change the ball's direction
float speedX=random(1,20);
float speedY=random(1,20);
float radius=50;
float gravity=0.3;

void setup(){
  size(400,400);
  background(0);
  xPos=width/2;
  yPos=height/2;
  fill(150);
  ellipse(width/2,height/2,radius,radius);
}

void draw(){
  background(0);
  
  //gravity
  speedY+=gravity; 
  
  // add speed to xPos and yPos
  xPos+=speedX; 
  yPos+=speedY;
  
  /* change the direction of the movement of both X and Y scale
  when the ball approach the right edge and the left edge*/
  if(xPos>width-radius/2){  
  speedX=speedX*-1;
  xPos=width-radius/2;//make sure the ball is in the space.
  }
  if(xPos<radius/2){
  speedX=speedX*-1;
  xPos=radius/2;
  }
  if(yPos>height-radius/2){
  speedY=speedY*-0.95;
  yPos=height-radius/2;
  }
  if(yPos<radius/2){
  speedY=speedY*-0.9;
  yPos=radius/2;
  }
  if((yPos>=height-radius/2)&&(speedY<=0)){
  yPos=height-radius/2;
  speedX=speedX*0.9;//to stop the ball
  }

  fill(150);
  ellipse(xPos,yPos,radius,radius);
}
