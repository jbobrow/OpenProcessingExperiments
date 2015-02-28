
/*
Jason Moran
 Making Things Move
 Code, 08/05/11
 */

PImage yslLogo1;
PImage yslLogo2;
PImage yslLogo3;
PImage yslBackground;
float xPos1=100; //add float to the top because you might not want just a linnear effect, thus open it up to math opportunities 
float yPos1=100;
float xPos2=500;
float yPos2=500;
float xPos3=750;
float yPos3=750;
int yslRadius=75;
int yslRadius2=75;
int yslRadius3=75;
boolean isGoingRight=true;
boolean isGoingDown=true;
boolean isGoingRight2=true;
boolean isGoingDown2=true;
boolean isGoingRight3=true;
boolean isGoingDown3=true;

void setup() {
  size(1000, 820);
  background(0);
  smooth();
  yslLogo1 = loadImage("ysl-logo1.png");
  yslLogo2 = loadImage("ysl-logo2.png");
  yslLogo3 = loadImage("ysl-logo3.png");
  yslBackground = loadImage("ysl-background.jpg");
  xPos1 = yslRadius;
  yPos1 = yslRadius;
  xPos2 = yslRadius2;
  yPos2 = yslRadius2;
  xPos3 = yslRadius3;
  yPos3 = yslRadius3;
  imageMode(CENTER);
}

void draw() {
  noStroke();
  background(0); //must reset background in order to make sure the image does not "timewarp", but instead has no trail following it
  //  pushMatrix(); //using pushMatrix and popMatrix isolates the shape between them, so that the scaling, etc. only affects the element within push and pop
  //  scale(.3);
  image(yslBackground, width/2, height/2);
  image(yslLogo1, xPos1, yPos1); //the elephant is now defined by variables x(Pos) and y(Pos)
  image(yslLogo2, xPos2, yPos2);
  image(yslLogo3, xPos3, yPos3);
  //image(yslLogo2, xPos2, yPos2);
  //  image(yslLogo3, xPos3, yPos3);
  //  popMatrix(); //can't have a push without a pop

  //fill(R, G, B, opacity out of 255);
  //fill(255, 255, 255, 30);
  //rect(100, 100, 100, 100);

  //xPos = xPos + 1; set xPosition to whatever it was before plus one
  //short code of making it go right by 1 is "++", left by one is "--", right by an integer "xPos+=Int", left by an integer "xPos-=3"

  //always move one at a time
  //  yPos+=1;

  //THIS IS THE X-CODE, FOR THE RIGHT AND LEFT OF THE FRAME
  //this is how to make it change direction if it is going right (x-direction)
  if (isGoingRight) {
    xPos1+=2;
    // xPos1 = xPos1 +4;
  }
  else {
    xPos1-=2;
    //xPos = xPos -4;
  }




  //making things bounce
  // 1) first find out the size of your image --> make sure to check scale changes as well
  // 2) set if statement

  if (xPos1 + yslRadius >= width) {
    isGoingRight=false;
  }

  //this is how to make it change direction if it is going left (y-direction)
  //if ("edge of elephant" hits "left frame") {
  //it should go Right
  if (xPos1 - yslRadius <= 0) {
    isGoingRight=true;
  }

  //THIS IS THE Y-CODE, FOR THE BOTTOM AND TOP OF THE FRAME
  //If Going Down, we want Y position adding; if we don't want it going down, but rather up, we need to take away Y-values
  if (isGoingDown) {
    yPos1+=2;
    //yPos = yPos +4;
  }
  else {
    yPos1-=2;
    //yPos = yPos -4;
  }



  if (yPos1 + yslRadius >= height) { //this is plus because you want the bottom of the elephant (the y-value as positive since you add to the radius)
    isGoingDown=false;
  }

  if (yPos1 - yslRadius <= 0) { //this is minus because you want the top of the elephant (you subtract from the radius to get the top)
    isGoingDown=true;
  }

  //THIS DEFINES ELEMENTAL MOVEMENT OF YSLLOGO2

  //THIS IS THE X-CODE, FOR THE RIGHT AND LEFT OF THE FRAME
  //this is how to make it change direction if it is going right (x-direction)
  if (isGoingRight2) {
    xPos2+=1;
    //xPos = xPos +4;
  }
  else {
    xPos2-=1;
    //xPos = xPos -4;
  }




  //making things bounce
  // 1) first find out the size of your image --> make sure to check scale changes as well
  // 2) set if statement

  if (xPos2 + yslRadius >= width) {
    isGoingRight2=false;
  }

  //this is how to make it change direction if it is going left (y-direction)
  //if ("edge of elephant" hits "left frame") {
  //it should go Right
  if (xPos2 - yslRadius <= 0) {
    isGoingRight2=true;
  }

  //THIS IS THE Y-CODE, FOR THE BOTTOM AND TOP OF THE FRAME
  //If Going Down, we want Y position adding; if we don't want it going down, but rather up, we need to take away Y-values
  if (isGoingDown2) {
    yPos2+=1;
    //yPos = yPos +4;
  }
  else {
    yPos2-=1;
    //yPos = yPos -4;
  }



  if (yPos2 + yslRadius >= height) { //this is plus because you want the bottom of the elephant (the y-value as positive since you add to the radius)
    isGoingDown2=false;
  }

  if (yPos2 - yslRadius <= 0) { //this is minus because you want the top of the elephant (you subtract from the radius to get the top)
    isGoingDown2=true;
  }

  //THIS DEFINES ELEMENTAL MOVEMENT FOR YSLLOGO3

  //THIS IS THE X-CODE, FOR THE RIGHT AND LEFT OF THE FRAME
  //this is how to make it change direction if it is going right (x-direction)
  if (isGoingRight3) {
    xPos3+=3;
    //xPos = xPos +4;
  }
  else {
    xPos3-=3;
    //xPos = xPos -4;
  }




  //making things bounce
  // 1) first find out the size of your image --> make sure to check scale changes as well
  // 2) set if statement

  if (xPos3 + yslRadius >= width) {
    isGoingRight3=false;
  }

  //this is how to make it change direction if it is going left (y-direction)
  //if ("edge of elephant" hits "left frame") {
  //it should go Right
  if (xPos3 - yslRadius <= 0) {
    isGoingRight3=true;
  }

  //THIS IS THE Y-CODE, FOR THE BOTTOM AND TOP OF THE FRAME
  //If Going Down, we want Y position adding; if we don't want it going down, but rather up, we need to take away Y-values
  if (isGoingDown3) {
    yPos3+=3;
    //yPos = yPos +4;
  }
  else {
    yPos3-=3;
    //yPos = yPos -4;
  }



  if (yPos3 + yslRadius >= height) { //this is plus because you want the bottom of the elephant (the y-value as positive since you add to the radius)
    isGoingDown3=false;
  }

  if (yPos3 - yslRadius <= 0) { //this is minus because you want the top of the elephant (you subtract from the radius to get the top)
    isGoingDown3=true;
  }
}


