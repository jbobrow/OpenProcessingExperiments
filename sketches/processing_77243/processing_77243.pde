
PImage Forest;
PImage Mouse;
PImage MouseScared;
PImage Hawk;
PImage Cat;
float mY = 0; 
float mX = 0; 
float cY = 0; 
float cX = 0; 
float hY = 0; 
float hX = 0; 
float mMoveY; //mouse
float mMoveX; 
float cMoveY; //cat
float cMoveX; 
float hMoveY; // hawk
float hMoveX; 
float maxSpeed = 3.0; 
float radius = 20.0; 
boolean mScared = false;

void setup() {
  size(300, 300);
  Forest = loadImage("LandScape.jpg");
  Mouse = loadImage("Mouse.jpg");
  Hawk = loadImage("Hawk.jpg");
  Cat = loadImage("Cat.jpg");
  MouseScared = loadImage("MouseScared.jpg");
  mMoveX=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the x
  mMoveY=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the y
  hMoveX=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the x
  hMoveY=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the y
  cMoveX=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the x
  cMoveY=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the y
  cX=random(width-radius); // sets the starting position of the red ellipse in the x
  cY=random(height-radius); // sets the starting position of the red ellipse in the y
  hX=random(width-radius); // sets the starting position of the green ellipse in the x
  hY=random(height-radius); // sets the starting position of the green ellipse in the y
  mX=random(radius*2, width-radius*2);  // sets the starting position of the white ellipse in the x
  mY=random(radius*2, height-radius*2);  // sets the starting position of the white ellipse in the y
  smooth();  // sets all 2D primitives to draw smoothly
  noStroke();
  ellipseMode(RADIUS);
  imageMode(CENTER);
}

void draw() {
  background(Forest);
  
  if(mX>hX){
    mX-=1;
  }else{
    mX+=1;
  }
  
  //////////RED "PREDATOR" ELLIPSE LOGIC
  cX+=cMoveX; // these 2 lines move the red ellipse
  cY+=cMoveY;
  if (cX>width-radius || cX<radius) { // these two if statements check to see if the red ellipse is still on screen and if not, then reverses the direction in which it is moving
    cMoveX=-cMoveX;
  }
  if (cY>width-radius || cY<radius) {
    cMoveY=-cMoveY;
  }
  fill(255, 0, 0); //sets the fill to red so the red ellipse is drawn as red
  //ellipse(cX, cY, radius, radius); // draws red ellipse
  image(Cat, cX, cY, radius*4, radius*4);
   
  //////////GREEN "PREDATOR" ELLIPSE LOGIC
  hX+=hMoveX; // these 2 lines move the green ellipse
  hY+=hMoveY;
  if (hX>width-radius || hX<radius) { // these two if statements check to see if the green ellipse is still on screen and if not, then reverses the direction in which it is moving
    hMoveX=-hMoveX;
  }
  if (hY>width-radius || hY<radius) {
    hMoveY=-hMoveY;
  }
  fill(0, 255, 0);
  //ellipse(hX, hY, radius, radius);
  image(Hawk, hX, hY, radius*3, radius*3);
  
  
     
  //////////WHITE "PREY" ELLIPSE LOGIC
  mX+=mMoveX;  // these 2 lines move the white "prey" ellipse
  mY+=mMoveY;
  if (mX>width-radius*2 || mX<radius*2) { // these two if statements check to see if the white ellipse is still on screen and if not, then reverses the direction in which it is moving
    mMoveX=-mMoveX;
  }
  if (mY>width-radius*2 || mY<radius*2) {
    mMoveY=-mMoveY;
  }
  if (dist(cX, cY, mX, mY)<radius*2 || dist(hX, hY, mX, mY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (mScared==false) {
      mMoveY=-mMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      mMoveX=-mMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
      mScared=true;
    }
  }
  else {
    mScared=false; // if the white ellipse will remain "scared" until it is not near either predator
  }
  if (mScared==true) { // if the white ellipse is "scared" then it remains yellow
    //fill(255, 255, 0);
    image(MouseScared, mX , mY, radius*2, radius*2);
  }
  else { // // if the white ellipse is not "scared" then it is white
    fill(255);
    image(Mouse, mX,mY, radius*2, radius*2);
  }
  //ellipse(mX, mY, radius*2, radius*2); // draw the white ellipse
  //image(Mouse, mX, mY, radius*2, radius*2);
  fill(0, 3);
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
}


