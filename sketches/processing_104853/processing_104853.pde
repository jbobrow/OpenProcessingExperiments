
//PLEASE HOLD YOUR LAPTOP UPSIDE DOWN//

//Set up variables

int x=10; // x-coordinate of ball
int y=10; // y-coordinate of ball

int r=6; // r-radius of ball

int xPos=50; // bouncing ball coordinates x-axis
float yPos=40; // bouncing ball coordinate y-axis

int bxPos=2; // bouncing ball direction on x-axis
float byPos=-0.5; // bouncing ball direction on y-axis

//Set up ball speed

int speed=3;

float gravity = 0.1;


//Setup Function
void setup() {
  size(500,100); //Size of window
  smooth();
}

//Setup Background and Ball Shape
  void draw(){
  byPos -= gravity;
  background(255);
  fill(0);
  ellipseMode(CENTER); 
  ellipse(xPos,yPos,r,r); //Draw ellipse with variables
  
// Set yPos variables to move
yPos = yPos + byPos;

//Set condition to bounce on y edge // tip from loso 25 on processing.org ! 
if((yPos>height-2)||(yPos<3)){
byPos = byPos * -0.9;
}

//Set xPos variable to move
xPos = xPos +bxPos;

// Set condition to bounce on x edge 
if((xPos > width - 5)||(xPos < 0)){
  bxPos = bxPos *-1;
}

}
