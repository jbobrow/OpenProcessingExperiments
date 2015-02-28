
/*Elizabeth Clare
 August 6 2011
 moving polarbear
 */
PImage northpole;
PImage bearcub;
PImage penguin;
int northpoleRadius=125;
float bearRadius=50;
float xPos=0;
float yPos=0;
float xPosP=0;
float yPosP;
float penguinRadius=20;
float leftEdgeOfPenguin;
float rightEdgeOfPenguin;
float leftEdgeOfBear;
float rightEdgeOfBear;

boolean isGoingRight=true;
boolean isGoingDown=true;

boolean penguinIsGoingRight=true;
boolean penguinIsGoingDown=true;

void setup() {

  size(500, 350);

  northpole=loadImage("northpole.jpg");
  northpole.resize(northpoleRadius*4, northpoleRadius*3);
  bearcub=loadImage("polarbear.png");
  penguin=loadImage("penguin.png"); 

  imageMode(CENTER);
  yPosP = height/2;
}


void draw() {
  image(northpole, width/2, height/2);
  image(bearcub, xPos, yPos);

  //x-position of bear  
  if (isGoingRight) {
    xPos+=2;
  }
  else {
    xPos-=2;
  }


  leftEdgeOfBear = xPos-bearRadius;
  rightEdgeOfBear = xPos+bearRadius; 



  //y-position of bear
  if (isGoingDown) {
    yPos+=2;
  }
  else {
    yPos-=2;
  }


  if (leftEdgeOfBear <= 0) {
    isGoingRight=true;
  }
  if (rightEdgeOfBear >= width) {
    isGoingRight=false;
  }

  if (yPos-bearRadius <= 0) {
    isGoingDown=true;
  }
  if (yPos+bearRadius >= height) {
    isGoingDown=false;
  }


  image(penguin, xPosP, yPosP); 

  //X-position of Penguin
  if (penguinIsGoingRight) {
    xPosP+=2;
  }
  else {
    xPosP-=2;
  }
  
  leftEdgeOfPenguin=xPosP-penguinRadius;
  rightEdgeOfPenguin=xPosP+penguinRadius;


  if (leftEdgeOfPenguin <= 0) {
    penguinIsGoingRight=true;
  }
  if (rightEdgeOfPenguin >= width) {
    penguinIsGoingRight=false;
  }
}


