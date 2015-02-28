
float xPos; //ball x
float yPos; //ball y
float xVel = 1; //speed for animation on x
float yVel = 1; //speed for animation on y
int xDir;
int yDir;
int xRad = 100; //radius for ellipse on x
int yRad = 100; // radius for ellipse on y

void setup(){ // info that won't change
   size (400,600); //frame size
   background (0); // background color
   xPos = width/2; //x start position mid of width
   yPos = height/2; //y start position mid of height
   
}

void draw(){
  background (0); //refreshes background
  frameRate (60); //sets the frame rate to 60 
  xPos = xPos + xVel; //adds speed to x position
  yPos = yPos + yVel; //adds speed to y position
  
  
  if (xPos <= xRad/2){ // if x position is less then the x radious of the ellipse
    xVel = 1;
    } // then increase 
    else if (xPos >= width - xRad/2){ // if the x position is greater then the  x radious of the ellipse
    xVel = -2;}// then decrease
  
  if (yPos <= yRad/2){ // if x position is less then the y radious of the ellipse
    yVel = 1;
    } // then increase
    else if (yPos >= height - yRad/2){ // if the x position is greater then the  x radious of the ellipse
    yVel = -2;
    } // then decrease
    
  
  fill (255,0,0); // sets the fill for the ball as red
  ellipse (xPos, yPos, xRad, yRad); // draws the ellips using the variables

}


