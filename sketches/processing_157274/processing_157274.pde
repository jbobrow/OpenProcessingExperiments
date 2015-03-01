
int nBalls = 10;
//Letter
float[] letterSize = new float[nBalls];
float[] posX = new float[nBalls];
float[] posY = new float[nBalls];
float[] speedY = new float[nBalls];
float[] speedX = new float[nBalls];
float[] hue = new float[nBalls];
int[] myNumber = new int[nBalls];
boolean[] isMoving = new boolean[nBalls];

float gravity = 0.1; 

void setup() {  // this is run once.   
  size(500, 500);
  colorMode(HSB);
  for (int i = 0; i < nBalls; i++) {
    posX[i] = random(width);    
    letterSize[i] = random(30, 80);
    posY[i] = random(height);
    speedY[i] = 0;
    speedX[i] = 0;        
    hue[i] = random(255);
    myNumber[i] = int(random(0, 9));
  }
} 

void draw() {  // this is run repeatedly.  
  background(0);

  for (int i = 0; i < nBalls; i++) {
    checkBoundaries(i);
    applyPhysics(i);    
    checkMousePosition(i);  
    collide(i);
  }
}

void collide(int _i) {
  float xDist, yDist, ballDistance;
  //WAYS 1
//  for (int otherBall=0; otherBall < nBalls; otherBall++) {  
//    if (otherBall != _i) {
//      xDist = posX[otherBall]-posX[_i];                                   
//      yDist = posY[otherBall]-posY[_i]; 
//      ballDistance = sqrt((xDist * xDist) + (yDist * yDist));
//      
//      if (letterSize[_i]/2 + letterSize[otherBall]/2 > ballDistance) {
//          speedX[_i] = -speedX[_i];
//          speedY[_i] = -speedY[_i];
//          speedX[otherBall] = -speedX[otherBall];
//          speedY[otherBall] = -speedY[otherBall];
//      } 
//    }
//  }
//WAYS 2
  for (int otherBall=0; otherBall < nBalls; otherBall++) {
    if (_i != otherBall) {
      ballDistance = dist(posX[_i], posY[_i], posX[otherBall], posY[otherBall]);
      if (ballDistance < (letterSize[_i] + letterSize[otherBall])/2 && ballDistance > 0) {
        speedX[_i] = -speedX[_i];
        speedY[_i] = -speedY[_i];
        speedX[otherBall] = -speedX[otherBall];
        speedY[otherBall] = -speedY[otherBall];
      }
     }
  }

//JUNK, just trying out
//      posX[_i] = posX[_i] + letterSize[_i]/2;
//      posY[_i] = posY[_i] + letterSize[_i]/2;      
//      posX[otherBall] = posX[otherBall] + letterSize[otherBall]/2;
//      posY[otherBall] = posY[otherBall] + letterSize[otherBall]/2;
   
  //    if(posY[_i] + letterSize[_i]/2 >= posY[_i+1] + letterSize[_i+1]/2) {
  //        println(posY[_i] + posY[_i+1]);
  //    }
}

void checkBoundaries(int _i) {
  //Boundaries
  //GROUND
  if (posY[_i] + letterSize[_i]/2 >= height) {    //touching the ground
    //Set the position to the ground so the object doesn't get stuck
    posY[_i] = height - letterSize[_i]/2;
    if (speedY[_i] > 1) {
      speedY[_i] = -speedY[_i] * 0.8;
    } else {
      speedY[_i] = 0;
    }
  }
  //SIDES
  //right side
  if (posX[_i] + letterSize[_i]/2 >= width) {
    //Set the position to the right side so the object doesn't get stuck
    posX[_i] = width - letterSize[_i]/2;       
    speedX[_i] = -speedX[_i] * 0.8;
    //left side
  } else if (posX[_i] - letterSize[_i]/2 <= 0) {
    //Set the position to the right side so the object doesn't get stuck
    posX[_i] = letterSize[_i]/2;       
    speedX[_i] = -speedX[_i] * 0.8;
  }
}


void applyPhysics(int _i) {
  //Acceleration (gravity)
  if (isMoving[_i] == true) {
    speedY[_i] = speedY[_i] + gravity;
  }

  //Move!
  posX[_i] = posX[_i] + speedX[_i];    
  posY[_i] = posY[_i] + speedY[_i];
}

void checkMousePosition(int _i) {
  //Check mouse position
  float saturation = 255;
  float myDistance = dist(mouseX, mouseY, posX[_i], posY[_i]);
  if (myDistance < letterSize[_i]/2) {
    saturation = 150;
    if (mousePressed) {
      posX[_i] = mouseX;
      posY[_i] = mouseY;
    } else {
      isMoving[_i] = true;
      speedX[_i] = mouseX - pmouseX;
    }
  }

  //NEW STUFF!!!
  //I'm calling drawCircle from inside checkMousePosition because saturation is a LOCAL variable — that is, it only exists here inside this function
  drawCircle(_i, saturation);
}

void drawCircle(int _i, float _saturation) {
  //Draw
  fill(hue[_i], _saturation, 255);
  ellipse(posX[_i], posY[_i], letterSize[_i], letterSize[_i]);
  fill(0);
  textSize(letterSize[_i]);
  textAlign(CENTER, CENTER);
  text(myNumber[_i], posX[_i], posY[_i]);
}


class Ball {
  
}


