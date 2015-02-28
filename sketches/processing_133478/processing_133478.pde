
/*
 This program creates an eye that tracks 
 face movement utilizing the OpenCV library.
 This eye is 2-d. It will stop moving when it reaches
 the border of the canvas.
 The ant class was utilized to give a more realistic look.
 The iris consists of a shutter-like look.
 Iris movement corresponds with face proximity to camera.
 For best performance, use when in good lighting
 and when only one person is visable.
 User can toggle between six colors and change the alpha value of the outer
 eye by dragging the mouse across the screen
 
 *Note: OpenCV was giving me issues with the new updated version of processing
 I used Processing 2.0.3 when making and testing this program
 
 Arturo Alviar
 1/30/2014
 */

//import libraries
import hypermedia.video.*;
import java.awt.*;

//Object declaratives
OpenCV opencv;
Eye eye = new Eye(200);
OuterEye[] outerEye = new OuterEye[7777];

//Global Variables 
color red, blue, green, violet, pink, white, c;
int alphaVal;
float newX, newY;

public void setup() {
  size(700, 500);
  smooth();
  //declare colors
  red = color(190, 0, 13);
  blue = color(0, 0, 255);
  green = color(0, 255, 0);
  violet =color(158, 0, 182);
  pink = color(255, 24, 187);
  white = color(255);
  //make red the default
  c = red;
  //make 255 the default alpha value
  alphaVal = 255;
  frameRate(60);
  //initiate openCV for face dectection
  opencv = new OpenCV( this );
  opencv.capture( width, height );                
  opencv.cascade( OpenCV.CASCADE_FRONTALFACE_ALT );
  //create array for outerEye
  for (int i =0; i < outerEye.length; i++) {
    outerEye[i] = new OuterEye();
  }
}

public void stop() {
  opencv.stop();
  super.stop();
}

void draw() {
  background(0); // draw background first
  fill(c); // fill the iris red
  newX = eye.getX(); // not really needed but makes things cleaner
  newY = eye.getY();
  strokeWeight(0.4);
  //make the outer eye (particles)
  for (int j = 0; j < outerEye.length; j++) {
    outerEye[j].update(newX, newY, eye.radius, c);
  }
  //start detecting face movement
  //move the eye around
  //make the iris
  eye.update(c);
}

//Eye Class (makes the pupil and eye)

class Eye {
  //instance variables
  float oldX, oldY, currentX, currentY, radius, diameter, pupilWidth, pupilHeight, flaps;

  Eye(float radius) {
    currentX = width/2;
    currentY = height/2;
    oldX = 0;
    oldY = 0;
    pupilWidth = 0;
    pupilHeight = 0;
    this.radius = radius;
    diameter = radius * 2;
    flaps = 10;
  }

  void update(color c) {
    float xDiff, yDiff, randX, randY, randX2, randY2, lastPupilWidth;
    //start reading feed from webcam
    opencv.read();
    //flip since webcam is mirrored
    //important! otherwise, eye moves in oppisite direction
    opencv.flip(OpenCV.FLIP_HORIZONTAL);
    //make an array to store all the faces visiable
    //can be problematic for the eye if more than one face is visible
    Rectangle[] faces = opencv.detect( 1.2, 2, OpenCV.HAAR_DO_CANNY_PRUNING, 40, 40 );
    //reccord the previous value of currentX
    oldX = currentX;
    oldY = currentY;
    for ( int i=0; i<faces.length; i++ ) {
      //make sure the eye doesnt leave the canvas
      //added 100 to the x to align the circle with face
      currentX = constrain(faces[i].x+100, radius, width-radius);
      currentY = constrain(faces[i].y+100, radius, height-radius);
      //pupil size is based on the proximity of the person visible
      pupilWidth = faces[i].width/2;
      pupilHeight = faces[i].height/2;
    }
    //do we need to move?
    //used to prevent unnecessary movement when face is still
    xDiff = checkDifference(currentX, oldX);
    yDiff = checkDifference(currentY, oldY);
    if (xDiff < 12) {
      currentX = oldX;
    }
    if (yDiff < 12) {
      currentY = oldY;
    }
    fill(0);
    //make pupil
    ellipse( currentX, currentY, diameter, diameter);
    ellipseMode(CENTER);
    //make cool iris
    float div = 2*PI/flaps;
    for (int i=0; i<flaps; i++) {
      float x = currentX + radius*sin(i*div);
      float y = currentY + radius*cos(i*div);
      float xf = currentX + radius*sin(i*div+PI/5);
      float yf = currentY + radius*cos(i*div+PI/5);
      float r = radius;
      float angle = map(pupilWidth+pupilWidth*1.5, 0, width, PI/4, PI/2);
      stroke(0); 
      strokeWeight(1);
      float xm = r*cos(-angle - i*div);
      float ym = r*sin(-angle - i*div);
      fill(c);
      beginShape();
      vertex(x, y);
      vertex(x+xm, y+ym);
      vertex(xf, yf);
      endShape();
    }
    //make outline so iris does not look too ugly
    noFill();
    strokeWeight(20);
    ellipse( currentX, currentY, diameter, diameter);
  }
  
  //simple function that returns the float of an absolute value of the difference 
  //between two values
  float checkDifference (float val1, float val2) {
    return abs(val1 - val2);
  }

  float getX() {
    return currentX;
  }
  
  float getY() {
    return currentY;
  }
}

//OuterEye class
//in charge of filling the outer eye
//this class is a modified version of assignment 6

class OuterEye {
  //instance varaibles
  float currentX, currentY, sizeOfSteps, newX, newY;
  OuterEye() {
    currentX = random(width);
    currentY = random(height);
    newX = 0;
    newY = 0;
    sizeOfSteps = random(5, 15);
  }
  void update(float x, float y, float radius, color c) {
    float direction, noiseScale;
    //check if x and y are rendered in circle
    //if so make the particle go somewhere else
    stroke(c, alphaVal);
    newX = currentX;
    newY = currentY;
    noiseScale = 0.008;
    direction = noise(currentX* noiseScale, currentY* noiseScale)*(2*PI);
    newX +=(sizeOfSteps*cos(direction));
    newY +=(sizeOfSteps*sin(direction));
    line(currentX, currentY, newX, newY);
    currentX = newX;
    currentY = newY;
    checkBounds();
    currentX= random(width);
    currentY= random(height);
  }

  //make sure the outer eye particles stay within the canvas 
  void checkBounds() {
    if (currentX > width || currentX < 0) {
      currentX = random(width);
    }
    if (currentY > height || currentY < 0) {
      currentY = random(height);
    }
  }
}

void keyReleased() {
  switch(key) {
  case 'r':
    c = red;
    break;
  case 'g':
    c = green;
    break;
  case 'b':
    c = blue;
    break;
  case 'v':
    c = violet;
    break;
  case 'p':
    c = pink;
    break;
  case 'w':
    c = white;
    break;
  }
}

void mouseDragged() {
  alphaVal = (int) map( mouseX, 0, width, 0, 255 );
}



