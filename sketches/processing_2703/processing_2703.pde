
// Slightly improved example of Diffusion-Limited Aggregation
// http://en.wikipedia.org/wiki/Diffusion-limited_aggregation

// This implements the algorithm described here:
// http://classes.yale.edu/fractals/Panorama/Physics/DLA/DLA3.html

// Tom Heath 2009

float[] pX, pY;
float startRadius = 10;
int maxP = 6000;
int pCount = 1;
float pSize = 2;
int stickDist = 3; 

void setup() {
  size(500,500,JAVA2D);
  background(20);
  strokeCap(ROUND);
  strokeJoin(ROUND);
  colorMode(HSB);
  strokeWeight(2);
  smooth();

  pX = new float[maxP];
  pY = new float[maxP];

  pX[0] = 0;
  pY[0] = 0;
}

void draw() {
  // declaring these here to save some overhead in inner loops
  float arrayDist, arraySize;
  float maxJumpDist = width;
  int closestElement = 0;

  translate(width/2,height/2);

  // spawn a fresh p
  float theta = random(TWO_PI);
  float newElementX=startRadius*sin(theta);
  float newElementY=startRadius*cos(theta);

  // loop until we've plotted a new p
  while (true) {
    // find the max dist from the array and the closest element
    for (int i=0; i<pCount; i++) {
      arrayDist = dist(pX[i],pY[i],newElementX,newElementY);
      if (arrayDist<maxJumpDist) {
        maxJumpDist = arrayDist;
        closestElement = i;
      }
    }

    // is the p close enough to stick?
    if (maxJumpDist<=stickDist) {
      // if so, work out where to plot it
      theta = atan2(newElementY-pY[closestElement], newElementX-pX[closestElement]);
      pX[pCount] = pX[closestElement] + pSize*cos(theta);
      pY[pCount] = pY[closestElement] + pSize*sin(theta);
      // draw that sucka
      stroke(((float)pCount/maxP)*255,120,255,120);
      line(pX[pCount],pY[pCount],pX[closestElement],pY[closestElement]);
      // adjust our p start radius, increment and either stop or bust outta here
      for (int i=0; i<pCount; i++) {
        arraySize = dist(pX[i],pY[i],0,0);
        if (arraySize>startRadius) {
          startRadius = arraySize;
        }
      }
      pCount++;
      if (pCount == maxP) {
        noLoop();
      }
      break;
    }

    // move p
    theta = random(TWO_PI);
    newElementX+=random(maxJumpDist)*sin(theta);
    newElementY+=random(maxJumpDist)*cos(theta);
    if (dist(0,0,newElementX,newElementY)>startRadius*2) {
      newElementX=startRadius*sin(theta);
      newElementY=startRadius*cos(theta);
    }
  }
}

void mousePressed() {
  save("output.png");
  background(20);
  pCount=1;
  loop();
}






