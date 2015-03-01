
int maxDepth = 10;
int framesPerDepth = 50;

void setup() {
  size(500, 500);
  background(255);
  stroke(0);
  //frameRate(10);
  strokeWeight(20);
}

void draw() {
  int currentDepth = int (frameCount / framesPerDepth);
  if(currentDepth < maxDepth) {
    if(frameCount % framesPerDepth == 0) {
      background(255);
    }
    translate(width/8, height/2);
    dragon(currentDepth);
  }
}

void dragon(int currentDepth) {
  if (currentDepth > 0) {
    pushMatrix();
    scale(2*cos(PI/6)/3);
    rotate(PI/6);
    dragon(currentDepth-1);
    translate(0.75*width, 0);
    rotate(PI+PI/3);
    dragon(currentDepth-1);
    translate(0.75*width, 0);
    rotate(HALF_PI+PI/6);
    dragon(currentDepth-1);
    popMatrix();
  } else {
    line(0, 0, 0.75*width, 0);
  }
}



