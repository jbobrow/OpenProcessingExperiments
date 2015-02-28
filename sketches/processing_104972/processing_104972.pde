
float xPos; //x position of circle
float yPos;//y position of circle
float yVel;//ball speed
float grav;//acceleration
int rad;//radius of circle

void setup() {

  size(400, 400); //size of sketch
  xPos=width/2;//initial x position of circle
  yPos=0;//initial y position of circle
  rad=25;//radius 100 pixels of circle
  yVel=0;//initial speed
  grav= .1;
  
}

void draw() {

  background(0);//black background
  fill(255);//white filling for circle
  
   yPos= yPos + yVel; //then ball moves at initial speed
   
   yVel = yVel + grav; //add gravity to speed (initial speed + grav)
    
 
  if(yPos>height){ //if ball reaches bottom
   
    yVel = (yVel * - 0.95); //slows ball down each bounce by decreasing speed (yVel)
    
  }
  
  ellipse(xPos, yPos, rad, rad); //ball with x,y positions and radius 
}
