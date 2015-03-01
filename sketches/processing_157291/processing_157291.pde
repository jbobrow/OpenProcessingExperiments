
int nBalls =45;
float[] letterSize = new float[nBalls];
float[] posX = new float[nBalls];
float[] posY = new float[nBalls];
float[] speedY = new float[nBalls];
float[] speedX = new float[nBalls];
float[] hue = new float[nBalls];
int[] myNumber = new int[nBalls];
boolean[] isMoving = new boolean[nBalls];
  
float gravity = 0.1;
  
void setup() {  
  size(600, 600);
  colorMode(HSB);
  for (int i = 0; i < nBalls; i++) {
    posX[i] = random(width);  
    letterSize[i] = random(25, 100);
    posY[i] = random(height);
    speedY[i] = 0;
    speedX[i] = 0;      
    hue[i] = random(100,255);
    myNumber[i] = int(random(0, 9));
  }
}
  
void draw() {  // this is run repeatedly.
  background(0);
  
  for (int i = 0; i < nBalls; i++) {
    checkBoundaries(i);
    applyPhysics(i);  
    checkMousePosition(i);
    otherb(i);
  }
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
  
void otherb(int _i){
for (int j = 0; j < nBalls; j++ ) {
      if ( j != _i ) {
        float l = dist(posX[_i], posY[_i], posX[j], posY[j]);
        if (l <= letterSize[j]/2 + letterSize[_i]/2) {
          posX[_i] = posX[_i] - speedX[_i];
          posY[_i] = posY[_i] - speedY[_i];
          posX[j] = posX[j] - speedX[j];
          posY[j] = posY[j] - speedY[j];
          speedX[_i] = -speedX[_i]*0.8;
          speedY[_i] = -speedY[_i]*0.8;
          speedX[j] = -speedX[j]*0.8;
          speedY[j] = -speedY[j]*0.8;
        }
      }
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
  float saturation = 50;
  float myDistance = dist(mouseX, mouseY, posX[_i], posY[_i]);
  if (myDistance < letterSize[_i]/2) {
    saturation = 100;
    if (mousePressed) {
      posX[_i] = mouseX;
      posY[_i] = mouseY;
    } else {
      isMoving[_i] = true;
      speedX[_i] = mouseX - pmouseX;
      speedY[_i] = mouseY - pmouseY;
    }
  }
  
  //NEW STUFF!!!
  //I'm calling drawCircle from inside checkMousePosition because saturation is a LOCAL variable — that is, it only exists here inside this function
  drawCircle(_i, saturation);
}
  
void drawCircle(int _i, float _saturation) {
  //Draw
  fill(hue[_i], _saturation, 255);
  noStroke();
  ellipse(posX[_i], posY[_i], letterSize[_i], letterSize[_i]);
  fill(0);
  textSize(letterSize[_i]);
  textAlign(CENTER, CENTER);
  text(myNumber[_i], posX[_i], posY[_i]);
   
}



