
/* OMG SOUND INPUT WHAT */
import ddf.minim.*;

/*
  Sixfold II
  based on /Transfinite/ by Ryoji Ikeda
  alacenski@gmail.com
  20110611
*/

// how to do this

int canvasSize;
int lastMouseX;
int reflectionCount;
int rectSize = 50;
int depth = 0;

Minim minim;
AudioInput in;
float delta;
float deltaLeft;
float deltaRight;
float deltaNext;
float deltaNextLeft;
float deltaNextRight;
float deltaLast;
int futureLook = 20;

float theta = 0;
void setup() {
  canvasSize = 500;
  reflectionCount = 6;
  size(canvasSize, canvasSize);
  smooth();
  
  minim = new Minim(this);
  minim.debugOn();
  
  // get a line in from Minim, default bit depth is 16
  in = minim.getLineIn(Minim.STEREO, 512);
  
}
 // rotate the whole canvas 
void draw() {
   if (in.bufferSize() > 0) {
    deltaLeft = in.left.get(0);
    deltaRight = in.right.get(0);
    delta = deltaLeft + deltaRight / 2;
    
    deltaNextLeft = in.left.get(futureLook);
    deltaNextRight = in.right.get(10);
    deltaNext = deltaNextLeft + deltaNextRight / 2;
  }
  
  background(255);
  // take a thing, reflect it on six faces
  translate(width/2, height/2);
  theta += abs(delta * delta * HALF_PI) + TWO_PI/reflectionCount;
  rotate(radians(theta));
  drawSystem();
  lastMouseX = mouseX;
  deltaLast = delta;
}
void drawSegmentLine(int radius) {
  line(0, 0, 0, radius);
}

void drawSegment() {
  ellipse(0, 30, 5, 5);
}

void drawSystem() {
 
  int len = 0;
  pushMatrix();
  for (int h = 0; h < 1; h++) {
    for(int i = 0; i < reflectionCount; i++) { 
        rotate(TWO_PI / reflectionCount);
          
        drawSegmentLine(((int)delta) * 10);
        // shift the segment another half rotation
        
        pushMatrix();
        if (reflectionCount % 2 == 0) { // rotate another half rotation if number of slices is odd
          rotate((TWO_PI / reflectionCount)/2);
        }
        drawSegment();
        drawSegmentPattern();
          
        popMatrix();
    }
  }
  popMatrix();
}

void drawSegmentPattern() {
  depth++;
  
  rotate((TWO_PI / reflectionCount)/depth);
  noFill();
  stroke(0, depth*10);
  ellipse(random(0, 10), 
  (depth * 10 * random(delta, 1))+10,
  (depth * delta * PI),
  70 + (depth * 3 * delta)); 

  if (depth < 40) {
    drawSegmentPattern();
  } else {
    depth = 0;
  }
}

void stop() {
  // always close Minim audio classes when you are done with them
  in.close();
  minim.stop();
  
  super.stop();
}




