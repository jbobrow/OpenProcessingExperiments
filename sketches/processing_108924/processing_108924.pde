
//Alex Lee, asl1@andrew.cmu.edu, 60-257, HW4
//Copyright Alex Lee 2013, Pittsburgh PA

/*

Press arrow keys to move. 
Left-click to shrink character.
Press 'r' to restart.

Move to the right. Whenever you reach the edge of the screen, you will complete one iteration of the labyrinth. 
The labyrinth becomes more difficult to maneuver each iteration. But I couldn't get collision working correctly, 
so currently the obstacles can't block you. 

I also had an issue where if you're holding down left or right and press up, the left/right stops registering 
for some reason, and you have to press it again. 

*/

int iterationNum; 

color backgroundColor = #73626E;//#FFFFFF;
color borderColor = #413E4A;//#000000;
color obstacleColor = borderColor;
color playerColor = #F7E4BE;//#EA0000;

int borderHeight = 25;
int obstacleHeight = 25;
int obstacleWidth = 25;

boolean jumpingState;
float gravity = .2;
float friction = .01;
float groundHeight;
float pVelX; 
float pVelY;
float pMoveSpeed = .6;
float pMaxVelX = 10;
float pX;
float pY;
int pHeight;
int pWidth;

boolean upCollision = false;
boolean downCollision = true;
boolean leftCollision = false;
boolean rightCollision = false;

int obstacleXNum;
int obstacleYNum;

int[] obstacleXArray;
int[] obstacleYArray;

String explanationText;


void setup() {
  size(700, 200);
  noStroke();
  textSize(11);
  restartGame();
}

void restartGame() {
  background(backgroundColor);
  
  pVelX = 0;
  pVelY = 0;
  pHeight = 50;
  pWidth = pHeight;
  pX = 100;
  pY = height - borderHeight * 2 - pHeight;
  
  iterationNum = 1;
  
  jumpingState = false;
  
  obstacleXNum = width / obstacleWidth;
  obstacleYNum = (height - borderHeight * 3) / obstacleHeight;
  
  obstacleXArray = new int[0];
  obstacleYArray = new int[0];
}


void draw() {
  drawBackground();
  drawObstacles();
  //checkCollision();
  drawCharacter();
}

void drawBackground() {
  groundHeight = height - borderHeight * 2 - pHeight;
  
  background(backgroundColor);
  fill(borderColor);
  rect(0, 0, width, borderHeight);
  rect(0, height - borderHeight * 2, width, borderHeight * 2);
  fill(backgroundColor);
  explanationText = "LABYRINTH  |  Iteration " + iterationNum + "  |  Arrow keys to move  |  Left-click to shrink  |  R to restart";
  text(explanationText, 20, 165);
}

void drawObstacles() {
  //make an empty array, add coordinates(?) to it each iteration to generate blocks 
  //make it so you can't generate duplicate coordinates 
  //use a 2d array, or one array each for x and y? 
  fill(borderColor);
  for(int i = 0; i < obstacleXArray.length; i++) {
    rect(obstacleXArray[i] * obstacleWidth, obstacleYArray[i] * obstacleHeight + borderHeight, obstacleWidth, obstacleHeight);
  }
}

void checkCollision() {
  for(int i = 0; i < obstacleXArray.length; i++) {
    //left collision
    if(pX < (obstacleWidth * obstacleXArray[i] + obstacleWidth) && pX > (obstacleWidth * obstacleXArray[i])) {
      if(((pY + 1 < obstacleYArray[i] * obstacleHeight + obstacleHeight + borderHeight) && (pY + 1 > obstacleYArray[i] * obstacleHeight + borderHeight)) || ((pY - 1 + pHeight < obstacleYArray[i] * obstacleHeight + obstacleHeight + borderHeight) && (pY - 1 + pHeight > obstacleYArray[i] * obstacleHeight + borderHeight))) {
      //if(pY + pHeight/2 < obstacleYArray[i] * obstacleHeight + borderHeight + obstacleHeight && pY + pHeight/2 > obstacleYArray[i] * obstacleHeight + borderHeight) {
        
        leftCollision = true; 
        println("LC");
        pX = obstacleWidth * obstacleXArray[i] + obstacleWidth;
        //pVelX = 0;
      }
      else {
        leftCollision = false;
      }
    }
    else {
      leftCollision = false;
    }
    
    //right collision
    if(pX + pWidth < (obstacleWidth * obstacleXArray[i] + obstacleWidth) && pX + pWidth > (obstacleWidth * obstacleXArray[i])) {
      if(((pY + 1 < obstacleYArray[i] * obstacleHeight + obstacleHeight + borderHeight) && (pY + 1 > obstacleYArray[i] * obstacleHeight + borderHeight)) || ((pY - 1 + pHeight < obstacleYArray[i] * obstacleHeight + obstacleHeight + borderHeight) && (pY - 1 + pHeight > obstacleYArray[i] * obstacleHeight + borderHeight))) {
        rightCollision = true; 
        println("RC");
        pX = obstacleWidth * obstacleXArray[i] - pWidth;
        //pVelX = 0;
      }
      else {
        rightCollision = false;
      }
    }
    else {
      rightCollision = false;
    }
    
    //down collision 
    if(pY + pHeight > obstacleYArray[i] * obstacleHeight + borderHeight && pY + pHeight < obstacleYArray[i] * obstacleHeight + obstacleHeight + borderHeight) {
      //greater than top of block and smaller than bottom 
      if(((pX + 1 > obstacleXArray[i] * obstacleWidth) && (pX + 1 < obstacleXArray[i] * obstacleWidth + obstacleWidth)) || ((pX - 1 + pWidth > obstacleXArray[i] * obstacleWidth) && (pX - 1 + pWidth < obstacleXArray[i] * obstacleWidth + obstacleWidth))) {
        //greater than left, less than right
        downCollision = true;
        println("DC");
        pY = obstacleYArray[i] * obstacleHeight - pHeight;
      }
    }
      
    //else if //hitting ground) {
      //downCollision = true;
    //}
    else {
      downCollision = false;
    }
  }
}

void drawCharacter() {
  if(pY < groundHeight) {   //downCollision == false) {
    pVelY += gravity;
  }
  
  /*
  to prevent bouncing, one solution is to make it so that when the distance between pY and the ground is less than pVelY, it 
  snaps to the ground rather than moving the full amount
  */
  //bouncing
  if(groundHeight - pY < pVelY) {
    pVelY = 0;
    pY = groundHeight;
    jumpingState = false;
  }
  else {
    pY += pVelY;
  }
  
  //friction
  if(downCollision) {
    if(pVelX > 0 || pVelX < 0) {
      pVelX *= (1 - friction);
    }
  }
  
  pX += pVelX;
  
  
  if(pX >= width) {
    pX = -pWidth;
    increaseIteration();
  }
  
  fill(playerColor);
  rect(pX, pY, pHeight, pWidth);
}

void increaseIteration() {
  iterationNum++;
  
  //add block to array here 
  int tempX = round(random(obstacleXNum - 1));
  int tempY = round(random(obstacleYNum - 1));
  boolean checkBoolean = false;
  
  for(int i = 0; i < obstacleXArray.length; i++) {
    if(tempX == obstacleXArray[i] && tempY == obstacleYArray[i]) {
      checkBoolean = true;
    }
  }
  if (checkBoolean) {
    //how do you make it keep reiterating the above steps? should you make it its own function? 
  }
  
  obstacleXArray = append(obstacleXArray, tempX);
  println(obstacleXArray);
  obstacleYArray = append(obstacleYArray, tempY);
  println(obstacleYArray);
}


void keyPressed() { 
  if(key == CODED) {
    
    
    
    if(keyCode == LEFT) {
      if(leftCollision == false) {
        if(pVelX > -pMaxVelX) {
          pVelX -= pMoveSpeed;
        }
      }
    }
    if(keyCode == RIGHT) {
      if(rightCollision == false) {
        if(pVelX < pMaxVelX) {
          pVelX += pMoveSpeed;
        }
      }
    }
    if(keyCode == UP) {
      //how about if collision is false, you increase velocity
      //up works a bit differently tho than left or right, it should just give
      //a large boost in velocity 
      if(!jumpingState) {
        pVelY -= 5;
        jumpingState = true; 
      }
      //must put jumpingstate false somewhere - when it's touching the ground, so when down collision is true 
    }
    if(keyCode == DOWN) {
      
    }
    
  }
  if(key == 'r') {
    restartGame();
  }
}


void mousePressed() {
  float change = 5;//pHeight / 5;
  if(pHeight > 0 && pWidth > 0) {
    pHeight -= change; 
    pWidth -= change;
    pX += change / 2;
    pY += change;
  }
}


/*
when the character goes past the edge of the screen, he appears to the left of the
screen, he can't move further left past that 
-if his body is beyond the 0 threshold, he can't move beyond the first opening 

change colors to more appealing ones later 

maybe you start large, can click to make yourself smaller, but that runs the risk of
making you disappear 

use up arrow for jump

show the player what iteration they're on 

maybe you CAN go left, go to previous iterations? is that too complex for this 
initial sketch? maybe add it in a more fleshed out version? 

maybe additional text briefly appears and disappears 

TO DO: 
adding bricks
collision with bricks (should this be based on the physical brick (so when they hit, they can't go further), or on the
brick 'tile')
-can you use the same velocity method for bricks? how do you prevent the 'bounce'? 
--the velocity method should work, but you have to take into account both height and width 
---so if the height of the player is in 'range' of the brick height, then there's a check to see if they're close enough, and if they
are then it 'collides' and pushes player into brick 
---it checks for collision by testing the player against all the bricks every frame? 
i want to do both x and y velocity, maybe i should just focus on y for now? or try both? 
-i don't think the velocity method is feasible, just doing a check is better once it hits 


 
  
  //generate obstacles each iteration next 
  
  

*/


