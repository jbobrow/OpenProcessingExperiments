
/*
 * Creative Coding
 * Week 3, 04 - spinning top: curved motion with sin() and cos()
 * by Indae Hwang and Jon McCormack
 * Copyright (c) 2014 Monash University
 *
 * This sketch is the first cut at translating the motion of a spinning top
 * to trace a drawing path. This sketch traces a path using sin() and cos()
 *
 */

int topCount = 50;
float minDistance[] = new float[topCount];  // range of lines

float topX[] = new float[topCount];  // current drawing position
float topY[] = new float[topCount];  // current drawing position
float dx[] = new float[topCount];  // change in position at each frame
float dy[] = new float[topCount];  // change in position at each frame
float phase[] = new float[topCount];  // modifier to framerate
float rate[] = new float[topCount];  // modifier to framerate
float bRad[] = new float[topCount];  // radius of b points
float hRad[] = new float[topCount];  // max size of hand points
float handX[] = new float[topCount];  // position of top's hand
float handY[] = new float[topCount];  // position of top's hand

void setup() {
  size(500, 500, P2D);
  colorMode(HSB);
  
  randomSeed(hour()+minute()+second()+millis());
  
  int borderlessWidth = width/2 - 100;
  int borderlessHeight = height/2 - 100;

  for (int i=0; i<topCount; i++) {
    // initial positions
    topX[i] = width/2 + random(-borderlessWidth, borderlessWidth);
    topY[i] = height/2 + random(-borderlessHeight, borderlessHeight);

    // dx and dy are the small changes in position each frame
    dx[i] = random(-1, 1);
    dy[i] = random(-1, 1);
    
    bRad[i] = random(50, 150);
    hRad[i] = random(50, 150);
    
    phase[i] = random(360);
    rate[i] = random(0.001, 0.025);
    minDistance[i] = random(10,100);
  }
  
  background(0);
}


void draw() {
  // blend the old frames into the background
  /* Comment out since not recognised by javascript 
  blendMode(BLEND);
  */
  fill(0, 4);
  rect(0, 0, width, height);
  
  float maxD = 1;
  float minD = 0.5;

  // for each top
  for (int i=0; i<topCount; i++) {
    // calculate new position
    topX[i] += dx[i];
    topY[i] += dy[i];
    
    // calculate top's rotation angle
    float radTop = radians (frameCount * rate[i] + phase[i]);

    //When the shape hits the edge of the window, it reverses its direction and changes velocity
    if (topX[i] > width-100 || topX[i] < 100) {
      dx[i] = dx[i] > 0 ? -random(minD, maxD) : random(minD, maxD);
    }

    if (topY[i] > height-100 || topY[i] < 100) {
      dy[i] = dy[i] > 0 ? -random(minD, maxD) : random(minD, maxD);
    }

    float bx = topX[i] + bRad[i] * sin(radTop);
    float by = topY[i] + bRad[i] * cos(radTop);

    float handRadius = hRad[i] * sin(radTop*0.1);
    handX[i] = bx + handRadius * sin(radTop*3);
    handY[i] = by + handRadius * cos(radTop*3);
  }

  strokeWeight(1);
  
  for (int i=0; i<topCount-1; i++) {
    for (int j=i+1; j<topCount; j++) {
      float tempDistance = dist(handX[i], handY[i], handX[j], handY[j]);
      if ( tempDistance < minDistance[i] + minDistance[j]) {
        stroke(255 * tempDistance / (minDistance[i] + minDistance[j]), 128, 255, 32);
        line(handX[i], handY[i], handX[j], handY[j]);
      }
    }
  }
}

void keyReleased() {
  if (key == 's') {
    saveFrame("yourName.jpg");
  }
}



