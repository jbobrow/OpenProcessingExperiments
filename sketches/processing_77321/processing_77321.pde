
//based on shranks basic predator and prey idea

float pY = 0; // variable that controls y coordinate of prey ellipse
float pX = 0; // variable that controls x coordinate of prey ellipse
float gY = 0; // variable that controls y coordinate of green predator ellipse
float gX = 0; // variable that controls x coordinate of green predator ellipse
float rY = 0; // variable that controls y coordinate of red predator ellipse
float rX = 0; // variable that controls x coordinate of red predator ellipse
float pMoveY; // variable that changes in the y to move the prey ellipse
float pMoveX; // variable that changes in the x to move the prey ellipse
float gMoveY; // variable that changes in the y to move the green predator ellipse
float gMoveX; // variable that changes in the x to move the green predator ellipse
float rMoveY; // variable that changes in the y to move the red predator ellipse
float rMoveX; // variable that changes in the x to move the red predator ellipse
float maxSpeed = 3.0; // variable that sets the maximum speed at which creatures can move
float radius = 20.0; // variable that sets the size of the ellipses
boolean pScared = false; // boolean variable that lets the white ellipse to remain scared
boolean pHungry = false;
boolean gScared = false; // boolean variable that lets the white ellipse to remain scared
boolean gHungry = false;
boolean rScared = false; // boolean variable that lets the white ellipse to remain scared
boolean rHungry = false;
void setup() {
  size(400, 400); // sets the size of the sketch
  background(0); // draws the background black
    PImage img;
  img = loadImage("spirals_of_circles.png");
  image(img, 0, 0);
  pMoveX=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the x
  pMoveY=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the y
  gMoveX=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the x
  gMoveY=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the y
  rMoveX=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the x
  rMoveY=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the y
  rX=random(width-radius); // sets the starting position of the red ellipse in the x
  rY=random(height-radius); // sets the starting position of the red ellipse in the y
  gX=random(width-radius); // sets the starting position of the green ellipse in the x
  gY=random(height-radius); // sets the starting position of the green ellipse in the y
  pX=random(radius*1.2, width-radius*1.2);  // sets the starting position of the white ellipse in the x
  pY=random(radius*1.2, height-radius*1.2);  // sets the starting position of the white ellipse in the y
  smooth();  // sets all 2D primitives to draw smoothly
  noStroke();  // sets all 2D primitives to draw without outlines
  ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius width and radius height
}
void draw() {
  //////////RED "PREDATOR" ELLIPSE LOGIC
  rX+=rMoveX; // these 2 lines move the red ellipse
  rY+=rMoveY;
  if (rX>width-radius || rX<radius) { // these two if statements check to see if the red ellipse is still on screen and if not, then reverses the direction in which it is moving
    rMoveX=-rMoveX;
  }
  if (rY>width-radius || rY<radius) {
    rMoveY=-rMoveY;
  }
      if (dist(pX, pY/* preadtor*/, rX, rY/*self*/)<radius*1.2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (gScared==false) {
      rMoveY=-pMoveY*1.2; // if the white ellipse is close to a predator, then it reverses direction in the y
      rMoveX=-pMoveX*1.2; // if the white ellipse is close to a predator, then it reverses direction in the x
      rScared=true;
    }
  }
  else {
    rScared=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (rScared==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255, 255, 0);
  }
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
  }
  
  //            REDREDREDREDREDREDREDREDRED
  
     if (dist(pX, pY/*prey*/, gX, gY/*self*/)<radius*3) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (gHungry==false) {
      gMoveY=+rMoveY*.75; // if the white ellipse is close to a predator, then it reverses direction in the y
      gMoveX=+rMoveX*.75; // if the white ellipse is close to a predator, then it reverses direction in the x
      gHungry=true;
    }
  }
  else {
    gHungry=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (gHungry==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255, 0, 255);
  }
  else if (gScared == true)
   fill (255, 255, 0);
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
  }
  fill(255, 0, 0); //sets the fill to red so the red ellipse is drawn as red
  ellipse(rX, rY, radius, radius); // draws red ellipse
   
  //////////GREEN "PREDATOR" ELLIPSE LOGIC
  gX+=gMoveX; // these 2 lines move the green ellipse
  gY+=gMoveY;
  if (gX>width-radius || gX<radius) { // these two if statements check to see if the green ellipse is still on screen and if not, then reverses the direction in which it is moving
    gMoveX=-gMoveX;
  }
  if (gY>width-radius || gY<radius) {
    gMoveY=-gMoveY;
  }
    if (dist(rX, rY/* preadtor*/, gX, gY/*self*/)<radius*1.2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (gScared==false) {
      pMoveY=-gMoveY*1.2; // if the white ellipse is close to a predator, then it reverses direction in the y
      pMoveX=-gMoveX*1.2; // if the white ellipse is close to a predator, then it reverses direction in the x
      gScared=true;
    }
  }
  else {
    gScared=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (gScared==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255, 255, 0);
  }
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
  }
  
     if (dist(pX, pY/*prey*/, gX, gY/*self*/)<radius*3) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (gHungry==false) {
      gMoveY=+rMoveY*.75; // if the white ellipse is close to a predator, then it reverses direction in the y
      gMoveX=+rMoveX*.75; // if the white ellipse is close to a predator, then it reverses direction in the x
      gHungry=true;
    }
  }
  else {
    gHungry=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (gHungry==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255, 0, 255);
  }
  else if (gScared == true)
   fill (255, 255, 0);
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
  }
  
  fill(0, 255, 0);
  ellipse(gX, gY, radius, radius);
   
     
  //////////WHITE "PREY" ELLIPSE LOGIC
  pX+=pMoveX;  // these 2 lines move the white "prey" ellipse
  pY+=pMoveY;
  if (pX>width-radius*1.2 || pX<radius*1.2) { // these two if statements check to see if the white ellipse is still on screen and if not, then reverses the direction in which it is moving
    pMoveX=-pMoveX;
  }
  if (pY>width-radius*1.2 || pY<radius*1.2) {
    pMoveY=-pMoveY;
  }
  if (dist(gX, gY/* preadtor*/, pX, pY/*self*/)<radius*1.2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (pScared==false) {
      pMoveY=-gMoveY*1.2; // if the white ellipse is close to a predator, then it reverses direction in the y
      pMoveX=-gMoveX*1.2; // if the white ellipse is close to a predator, then it reverses direction in the x
      pScared=true;
    }
  }
  else {
    pScared=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (pScared==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255, 255, 0);
  }
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
  }
  
     if (dist(rX, rY/*prey*/, pX, pY/**/)<radius*3) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (pHungry==false) {
      pMoveY=+rMoveY*.75; // if the white ellipse is close to a predator, then it reverses direction in the y
      pMoveX=+rMoveX*.75; // if the white ellipse is close to a predator, then it reverses direction in the x
      pHungry=true;
    }
  }
  else {
    pHungry=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (pHungry==true) { // if the white ellipse is "scared" then it remains yellow
    fill(255, 0, 255);
  }
  else if (pScared == true)
   fill (255, 255, 0);
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
  }
  
  ellipse(pX, pY, radius*1.2, radius*1.2); // draw the white ellipse
  fill(0, 3);
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
}
