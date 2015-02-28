
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/76219*@* */ 

/* !do not delete the line above, required for linking your tweak if you re-upload */ 
//"2 Predator and 1 Prey Example"  

//by Brian Schrank, October 2012  


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

float run = 0.7;  

float maxSpeed = 4.0;  

float LBSpeed = 2.0;  

float RBSpeed= 3;// variable that sets the maximum speed at which creatures can move  

float radius = 20.0; // variable that sets the size of the ellipses  

boolean pScared = false; // boolean variable that lets the white ellipse to remain scared  

PImage field;  

PImage soccer;  

PImage oldman;  

PImage predator;  

void setup() {   

  field= loadImage("soccer_field.png");  

  soccer = loadImage("soccer.png");  

  oldman= loadImage("oldman.png");  

  predator= loadImage("predator.png");  

  size(800, 400); // sets the size of the sketch  

  background(0); // draws the background black  

//  pMoveX=random(-RBSpeed, RBSpeed); // sets the white ellipse speed in the x  

//  pMoveY=random(-RBSpeed, RBSpeed); // sets the white ellipse speed in the y  

  gMoveX=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the x  

  gMoveY=random(-maxSpeed, maxSpeed); // sets the green ellipse speed in the y  

  rMoveX=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the x  

  rMoveY=random(-maxSpeed, maxSpeed); // sets the red ellipse speed in the y  

  rX=750;  

  // rX=random(width-radius); // sets the starting position of the red ellipse in the x  

  rY=random(height-radius+10); // sets the starting position of the red ellipse in the y  

  gX=750;  

  //gX=random(width-radius); // sets the starting position of the green ellipse in the x  

  gY=random(height-radius+10); // sets the starting position of the green ellipse in the y  

  pX=50;  

  //pX=random(radius*2, width-radius*2);  // sets the starting position of the white ellipse in the x  

  pY=random(radius*2, height-radius*2);  // sets the starting position of the white ellipse in the y  

  smooth();  // sets all 2D primitives to draw smoothly  

  noStroke();  // sets all 2D primitives to draw without outlines   

  ellipseMode(RADIUS); // sets ellipses to draw using the last two numbers as radius width and radius height  

}  

void draw() {  

  //////////RED "PREDATOR" ELLIPSE LOGIC  

     

  background(0);  

  image(field,0,0);  

  rX+=rMoveX; // these 2 lines move the red ellipse  

  rY+=rMoveY;  

  if (rX>width-radius || rX<radius) { // these two if statements check to see if the red ellipse is still on screen and if not, then reverses the direction in which it is moving  

    rMoveX=-rMoveX;  

  }  

  if (rY>height-radius || rY<radius) {  

    rMoveY=-rMoveY;  

  }  

  //fill(255, 0, 0); //sets the fill to red so the red ellipse is drawn as red  

     

  ellipse(rX, rY, radius, radius); // draws red ellipse  

  image(soccer,rX-27,rY-21);  

  //////////GREEN "PREDATOR" ELLIPSE LOGIC  

//  gX+=gMoveX; // these 2 lines move the green ellipse  

 // gY+=gMoveY;  

  if (gX>width-radius || gX<radius) { // these two if statements check to see if the green ellipse is still on screen and if not, then reverses the direction in which it is moving  

  //  gMoveX=-gMoveX;  

  }  

  if (gY>height-radius || gY<radius) {  

   // gMoveY=-gMoveY;  

  }  

 // fill(0, 255, 0);  

  ellipse(gX, gY, radius, radius);  

  image(predator,gX-30,gY-20);  

if (dist(gX, gY, pX, pY)<1000) {  

    if (gX < pX) {  

      gX+=LBSpeed*run;  

    }   

    else {  

      gX-=LBSpeed*run;  

    }  

    if (gY < pY) {  

      gY+=LBSpeed*run;  

    }  

    else {  

      gY-=LBSpeed*run;  

    }  

  }  

   

  //////////WHITE "PREY" ELLIPSE LOGIC  

 // pX+=pMoveX;  // these 2 lines move the white "prey" ellipse  

 // pY+=pMoveY;  

  if (pX>width-radius*2 || pX<radius*2) { // these two if statements check to see if the white ellipse is still on screen and if not, then reverses the direction in which it is moving  

  //  pMoveX=-pMoveX;  

  }  

  if (pY>height-radius*2 || pY<radius*2) {  

  //  pMoveY=-pMoveY;  

  }  

  if (dist(pX, pY, gX, gY)<80) {  

    if (pX < gX) {  

      pX+=-RBSpeed;  

    }   

    else {  

      pX-=-RBSpeed;  

    }  

    if (pY < gY) {  

      pY+=-RBSpeed;  

    }  

    else {  

      pY-=-RBSpeed;  

    }  

  }  

  if (dist(pX, pY, rX, rY)<1000) {  

    if (pX < rX) {  

      pX+=RBSpeed;  

    }   

    else {  

      pX-=RBSpeed;  

    }  

    if (pY < rY) {  

      pY+=RBSpeed;  

    }  

    else {  

      pY-=RBSpeed;  

    }  

  }  

 if (dist(pX,pY,rX,rY)<20) {  

  rX=random(width-radius+20);  

 rY=random(height-radius+20);  

 }   

     

//if (dist(pX,pY,gX,gY)<radius*5) {  

  //pMoveX=-pMoveX;  

 // pMoveY=-pMoveY;  

//}  

  if (dist(gX, gY, pX, pY)<radius*2) { // this if statement checks to see if the white ellipse is near either of the predator ellipses  

   //dist(rX, rY, pX, pY)<radius*5 ||  

   if (pScared==false) {  

     pX=-pX;  

     pY=-pY;  

  //  pMoveY=-pMoveY; // if the white ellipse is close to a predator, then it reverses direction in the y  

  //  pMoveX=-pMoveX; // if the white ellipse is close to a predator, then it reverses direction in the x  

    pScared=true;  

   }  

   }  

  else {  

    pScared=false; // if the white ellipse will remain "scared" until it is not near either predator  

  }  

  if (pScared==true) { // if the white ellipse is "scared" then it remains yellow  

    fill(255, 255, 0);  

    pX=50;  

    pY=random(radius*2, height-radius*2);  

  }  

  else { // // if the white ellipse is not "scared" then it is white  

    fill(255);  

  }  

  fill(0, 3);  

  ellipse(pX, pY, radius*2, radius*2); // draw the white ellipse  

      

  image(oldman,pX-30,pY-43);  

  rect(0, 0, width, height); // this and the above line draw a feint black rectangle over the entire screen (this is how we get the nice trails)  

} 



