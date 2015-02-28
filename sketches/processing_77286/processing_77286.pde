
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/77286*@* */
/* !do not delete the line above, required for linking your tweak if you re-upload */
//credit to Brian Schrank for most of the code

import ddf.minim.*;
AudioPlayer music; 
Minim minim;
PImage stadium;
PImage charizard;
PImage blastoise;
PImage venasaur;
PFont font;
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
float maxSpeed = 20.0; // variable that sets the maximum speed at which creatures can move
float radius = 30.0; // variable that sets the size of the ellipses
boolean gScared = false;
boolean rScared = false;
boolean pScared = false; // boolean variable that lets the white ellipse to remain scared
void setup() { 
  size(735, 1000); // sets the size of the sketch
   
  stadium=loadImage("stadium.png");
  charizard=loadImage("charizard.png");
  blastoise=loadImage("blastoise.png");
  venasaur=loadImage("venasaur.png");
  font = loadFont("Bauhaus93-34.vlw");
  //background(0); // draws the background black
  pMoveX=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the x
  pMoveY=random(-maxSpeed, maxSpeed); // sets the white ellipse speed in the y
  gMoveX=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the x
  gMoveY=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the y
  rMoveX=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the x
  rMoveY=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the y
  rX=(100); // sets the starting position of the red ellipse in the x
  rY=(100); // sets the starting position of the red ellipse in the y
  gX=(200); // sets the starting position of the green ellipse in the x
  gY=(200); // sets the starting position of the green ellipse in the y
  pX=(300);  // sets the starting position of the white ellipse in the x
  pY=(300);  // sets the starting position of the white ellipse in the y
  smooth();  // sets all 2D primitives to draw smoothly
  noStroke();  // sets all 2D primitives to draw without outlines 
  minim = new Minim(this);
  music = minim.loadFile("music.mp3", 1024); 
  music.loop();
  ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius width and radius height
}
void draw() {
  background(0);
  image(stadium,0,0);
  image(charizard,rX,rY); 
  image(blastoise,gX,gY);
  image(venasaur,pX,pY);
  //////////RED "PREDATOR" ELLIPSE LOGIC
  rX+=rMoveX; // these 2 lines move the red ellipse
  rY=rY+rMoveY;
  
  if (rX>width-radius || rX<radius) { // these two if statements check to see if the red ellipse is still on screen and if not, then reverses the direction in which it is moving
    rMoveX=-rMoveX;
  }
  if (rY>width-radius || rY<radius) {
    rMoveY=-rMoveY;
  }
  fill(255, 0, 0); //sets the fill to red so the red ellipse is drawn as red
  //rect(rX, rY, radius, radius); // draws red ellipse
  
  //////////GREEN "PREDATOR" ELLIPSE LOGIC
  gX+=gMoveX; // these 2 lines move the green ellipse
  gY+=gMoveY;
  if (gX>width-radius || gX<radius) { // these two if statements check to see if the green ellipse is still on screen and if not, then reverses the direction in which it is moving
    gMoveX=-gMoveX;
  }
  if (gY>width-radius || gY<radius) {
    gMoveY=-gMoveY;
  }
  fill(0, 255, 0);
 // ellipse(gX, gY, radius, radius);
  
  //////////WHITE "PREY" ELLIPSE LOGIC
  pX+=pMoveX;  // these 2 lines move the white "prey" ellipse
  pY+=pMoveY;
  if (pX>width-radius*2 || pX<radius*2) { // these two if statements check to see if the white ellipse is still on screen and if not, then reverses the direction in which it is moving
    pMoveX=-pMoveX;
  }
  if (pY>width-radius*2 || pY<radius*2) {
    pMoveY=-pMoveY;
  }
 
 ////VENASAUR WEAK VS CHARIZARD
  if (dist(rX, rY, pX, pY)<radius*2 || dist(gX, gY, pX, pY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (pScared==false) {
      pMoveY=-pMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      pMoveX=-pMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
      pScared=true;
      
      background(245,158,17);
     fill(0);
      smooth();
      textFont(font, 72); 
      text("IT'S SUPER EFFECTIVE!", 30, 70); 
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
 // ellipse(pX, pY, radius*2, radius*2); // draw the white ellipse
  fill(0, 3); 
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
  








//CHARIZARD WEAK VS BLASTOISE

 if (dist(gX, gY, rX, rY)<radius*2 || dist(pX, pY, rX, rY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (pScared==false) {
      rMoveY=-rMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      rMoveX=-rMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
       
      background(30,4,206);
      fill(0);
      smooth();
      textFont(font, 72); 
      text("IT'S SUPER EFFECTIVE!", 30, 70); 
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
 // ellipse(pX, pY, radius*2, radius*2); // draw the white ellipse
  fill(0, 3); 
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
  



///BLASTOISE WEAK VS VENASAUR

if (dist(pX, pY, gX, gY)<radius*2 || dist(rX, rY, gX, gY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (gScared==false) {
     
      background(31,245,17);
      
       fill(0);
      smooth();
      textFont(font, 72); 
      text("IT'S SUPER EFFECTIVE!", 30, 70); 
      gMoveY=-gMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      gMoveX=gMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
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
 // ellipse(pX, pY, radius*2, radius*2); // draw the white ellipse
  fill(0, 3); 
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
  




///BLASTOISE WEAK VS VENASAUR

if (dist(pX, pY, gX, gY)<radius*2 || dist(rX, rY, gX, gY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses
    if (gScared==false) {
     
      background(31,245,17);
      
       fill(0);
      smooth();
      textFont(font, 72); 
      text("IT'S SUPER EFFECTIVE!", 30, 70); 
      gMoveY=-rMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y
      gMoveX=-rMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x
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
 // ellipse(pX, pY, radius*2, radius*2); // draw the white ellipse
  fill(0, 3); 
  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)
  



} // end of void draw


