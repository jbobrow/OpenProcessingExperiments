
//Project inspired by Ms.Josephs impulse demostration in AP Physics
//Credit to Josh Nimoy jtnitmoy for the collision and the bounce method
//Based on original Josh Nimoy ball dropping app

public class Ball {
  int whiteXOrigin,whiteYOrigin;
  int radius = 20;
  
  public Ball(int x, int y) {
     whiteXOrigin = x;
     whiteYOrigin = y;
    
    
  }
  
  void show() {
    ellipse(whiteXOrigin,whiteYOrigin,radius,radius);
  }
}


float whiteX, whiteY, redX, redY;
float lineMinimum, lineMaximum;
float lineX1, lineY1, lineX2, lineY2;
int curLevel = 1;

int radius = 20;
int limit = 250;
float gravity = 0.8;

float bounce = -1.1;
boolean release = false;
boolean belowLimit = false;
boolean finish = false;
Line userLine = new Line(0, 0, 0, 0);
int tries = 0;
//float buttonX = mouseX;
//float buttonY = mouseY;

//int whiteOriginX = 250;
//int whiteOriginY = 10;

float whiteXV = 0;
float whiteYV = 0;



//setup game once the window starts
Ball whiteBall = new Ball(250,10);
void setup(){
  size(700,500);
  background(255);
  smooth();
  frameRate(40);
 

  setRedBall();
  setText();
}

//If the white ball is released, let it free fall

void draw(){
  if(release){
    background(255);
    redrawLine();
    drawLimit();
    drawWhiteBall();
    
    redrawRedBall();
    //checks whether the ball hits the line
    seeCollision();
    //must check winning condiiton
    bounce();
    checkWinningCollision();
    setText();
  }
}

//If it on the bottom it is good

void mousePressed(){
  
  if(mouseY > limit){
    
    belowLimit = true;
    background(255);
    //ellipse(whiteOriginX, whiteOriginY, radius, radius);
    ellipse(whiteBall.whiteXOrigin, whiteBall.whiteYOrigin, whiteBall.radius,whiteBall.radius);
    redrawRedBall();
    drawLimit();
    lineX1 = mouseX;
    lineY1 = mouseY;
    redrawWhiteBall();
    setText();
    release = false;
  }

}

//restarts the game

void keyPressed(){
  if(finish){
    background(255);
    curLevel = 1;
    tries = 0;
    setRedBall();
    setText();
    finish = false;
  }
}

//Draw the line by dragging the mouse

void mouseDragged(){
  if(belowLimit){
    //System.out.println("HI");
    background(255);
    lineX2 = mouseX;
    lineY2 = mouseY;
    redrawLine();
    //ellipse(whiteOriginX, whiteOriginY, radius, radius);
    
    ellipse(whiteBall.whiteXOrigin,whiteBall.whiteYOrigin,whiteBall.radius,whiteBall.radius);
    drawLimit();
    redrawRedBall();
    setText();
   }
}

//Checks whether the line the user makes is valid

void mouseReleased(){
  if(belowLimit && mouseY > limit){
    release = true;
    //belowLimit = true;
    tries ++;
    belowLimit = false;
    //if(lineX1 < lineX2){
      //lineMinimum = lineX1;
      //lineMaximum = lineX2;
      if (userLine.X1 < userLine.X2) {
       lineMinimum = userLine.X1;
       lineMinimum = userLine.X2;
      }else{
      //makes the new Y equal to lineY1
      float newY = lineY1;
      
      //makes the new X equal lineX1
      float newX = lineX1;
     
     //make sure it keeps lineX1
      lineX1 = lineX2;
      lineY1 = lineY2;
     
    
      lineY2 = newY;
      lineX2 = newX;
     
      lineMinimum = lineX1;
      lineMaximum = lineX2;
       
    
    }
  } else if(mouseY < limit){
     
      background(255);
      redrawWhiteBall();
      drawLimit();
      fill(255, 0, 0);
      noStroke();
      ellipse(redX, redY, radius, radius);
      fill(0);
      noFill();
      stroke(0);
      setText();
     }
}

//The physics in the game
//Also draws the white ball 

void drawWhiteBall(){
  
  whiteYV += gravity;
  
 whiteX += whiteXV;
  whiteY += whiteYV;
 //whiteBall.whiteXOrigin += whiteXV;
// whiteBall.whiteYOrigin += whiteYV;
  
 
  ellipse(whiteX, whiteY, radius, radius);
  //ellipse(whiteBall.whiteXOrigin, whiteBall.whiteYOrigin, whiteBall.radius, whiteBall.radius);
  seeCollision();
  
  checkLimit();
}





//Checks if the ball is within the screen

public boolean seeCollision() {
  //credit to jtnitmoy chrome experiement!!
  //for the use of code
  //credit to mr ferraro for the collision demonstration in class
  //using slopes and lines intersecting
  
  //credit to mr ferraro for the help on the distance
 float x1 = lineX1 - whiteX;
 float y1 = lineY1 - whiteY;
 
 float x2 = lineX2 - whiteX;
 float y2 = lineY2 - whiteY;
 
 //change in x and y
 float dx = x2 - x1;
 float dy = y2 - y1;
 
 //use of pythagorian theorem to find distance
 //credit to mr ferraro 
 float dr = sqrt(dx*dx + dy*dy);
 
 float D = x1 * y2 - x2 * y1;
 //finds the closest point to the line 
 //credit to jtnitmoy for the scaling of the radius and the total change in position
 float delta = ((whiteBall.radius * 0.9) *(whiteBall.radius * 0.9))
 * (dr * dr) - (D*D);
 //if the difference is greater than or equal to zero, collision is detected
 if (delta >= 0) {
   
   return true;
 }
 
 return false;

}  
//found on processing api a little bit of self implementation
// credit to jtnitmoy chrome experiement!!
void bounce() {
  
  //determines the angle of the ball as it goes down
  if (seeCollision()) {
    
    
  float angle = atan2(lineY2 - lineY1, lineX2 - lineX1);
  //Sin and Cos are used because of similar triangles
  //We need to find sin and cos because 
  //processing API 
  float sinAngle = sin(angle);
  float cosAngle = cos(angle);
  
  //finds the change in x and y values between the lies
  float thisX1 = whiteX - userLine.X1;
  float thisY1 = whiteY - userLine.Y1;
  
  //the use of trig based off my sketching and visual
  float xRotate = cosAngle * thisX1 + sinAngle * thisY1;
  float yRotate = cosAngle * thisY1 - sinAngle * thisX1;
  
  //the use of trig. based off my sketching and visual
  float ballXVR = cosAngle * whiteXV + sinAngle * whiteYV;
  float ballYVR = cosAngle * whiteYV - sinAngle * whiteXV;
  
  //Credit to Josh Nimroy
  if (yRotate > 0 - radius/2) {
    yRotate = 0 - radius/2;
    ballYVR *= bounce;
    
  }
  //Credit to Josh Nimroy for the help 
  thisX1 = cosAngle * xRotate - sinAngle * yRotate;
  thisY1 = cosAngle * yRotate + sinAngle * xRotate;
  whiteXV = cosAngle * ballXVR - sinAngle * ballYVR;
  whiteYV = cosAngle * ballYVR + sinAngle * ballXVR;
  
  whiteX = userLine.X1 + thisX1;
  whiteY = userLine.Y1 + thisY1;
}
}
void checkLimit(){
  if(whiteY > height + radius){
    redrawWhiteBall();
  } if(whiteX < 0 - radius){
    redrawWhiteBall();
  } else if(whiteX > width + radius){
    redrawWhiteBall(); 
  }
}

//Resets the white ball at it's previous location

void redrawWhiteBall(){
  whiteYV = 0;
  whiteXV = 0;
  //testing code
  //whiteX = whiteOriginX;
  //whiteY = whiteOriginY;
  whiteX = whiteBall.whiteXOrigin;
  whiteY = whiteBall.whiteYOrigin;
  release = false;
  //testing code
  //ellipse(whiteOriginX, whiteOriginY, radius, radius);
  ellipse(whiteBall.whiteXOrigin,whiteBall.whiteYOrigin, whiteBall.radius, whiteBall.radius);
}

//this redraws the users line everytime this method is called

void redrawLine(){
  userLine.X1 =lineX1;
  userLine.Y1 =lineY1;
  userLine.X2 =lineX2;
  userLine.Y2 = lineY2;
  userLine.show();
}

//this sets the target at the beginning of the level, and changes the wind

void setRedBall(){
  background(255);
  //whenever you draw a new red ball, the white ball must be placed back
  redrawWhiteBall();
  drawLimit();
  fill(255, 0, 0);
  noStroke();
  //generates the red ball randomly
  redX = random(10, 490);
  redY = random(20, limit);
  ellipse(redX, redY, radius, radius);
  fill(0);
  noFill();
  stroke(0);
 
}


void redrawRedBall(){
  fill(255, 0, 0);
  noStroke();
  ellipse(redX, redY, radius, radius);
  noFill();
  stroke(0);
}
//Checks the winning condition when the white ball hits the red

void checkWinningCollision(){
  //calculates the distance
  //if one point of the white ball touches one point of the red ball, then it's valid
  //credit to Mr. Ferraro and in class example of two points intersecting using the distance formula
  float curDis = getDis(whiteX, whiteY, redX, redY);
  if(curDis < radius){
    setRedBall();
    curLevel ++;
    if(curLevel == 15){
      background(255);
      curLevel= 0;
      finish = true; 
      if(tries > 20){
        text("In 15 levels you used " + tries + " lines.\nTry to beat it with 20 lines or less \nPress any key to try again.", 200, 200);
      }else if(tries < 21){
        text("You completed 15 levels with " + tries + " tries!\nPress any key play again.", 200, 200);
      }
    }
  }
}





//Calculating distance with distance formula

float getDis(float x1, float y1, float x2, float y2){
  float distanceX = x1 - x2;
  float distanceY = y1 - y2;
  float thisDistance = sqrt(distanceX*distanceX + distanceY*distanceY);
  return thisDistance;
}
//Draws the limit in which the user cannot draw lines above this limit

void drawLimit(){
  stroke(155);
  line(0, limit, width, limit);
  stroke(0);
}



//Sets the text

void setText(){
  fill(0);
  
  
  text("Level: " + curLevel, 5, 15);
  text("Lines: " + tries, 430, 15);
  noFill();
 
}
//Line Class

public class Line {
  float X1, Y1, X2,Y2;
  Line(float x, float y, float x1, float y1) {
   X1 = x;
   Y1 = y;
   X2 = x1;
   Y2 = y1;
  }
  
  void show() {
   line(X1, Y1, X2, Y2);
  }
  
}
