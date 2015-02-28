
// arrays holding nodes, number of nodes, and next node to go to
int[] xNodes = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int[] yNodes = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0};
int numNodes = 10;
int step = 1;

// inner circle position and size of inner and outer circles
int circX, circY;
int innerSize = 60;
int outerSize = 40;

// tests to move to next node, speed of circle
int speed = 2;
boolean xReached, yReached;


void setup() {
  size(600, 400);
  smooth();
  
  // create nodes
  for (int i = 0; i < numNodes; i++) {
    int xRnd = int(random(0, width));
    int yRnd = int(random(0, height));
    xNodes[i] = xRnd;
    yNodes[i] = yRnd;
  }
  
  // set up circle
  circX = xNodes[0];
  circY = yNodes[0];
  
}


void draw() {
  // draw transparent rectangle, creating motion blur
  noStroke();
  fill(40, 200, 210, 80);
  rect(0, 0, width, height);
  
  stroke(0);
  fill(250, 100, 20, 220);
  
  // draw nodes
  for (int i = 0; i < numNodes; i++) {
    strokeWeight(i+2);
    if (i == step) {
      stroke(255, 255, 100);
    }
    point(xNodes[i], yNodes[i]);
    stroke(0);
  }
  
  strokeWeight(2);
  
  // move circle
  if (abs(circX - xNodes[step]) < speed) {
    xReached = true;
  }
  else {
    if (xNodes[step] > circX) {
      circX+=speed;
    }
    else {
      circX-=speed;
    }
    yReached = false; // this helps prevent a bug where the circle will think it's reached the node before it has
  }
  if (abs(circY - yNodes[step]) < speed) {
    yReached = true;
  }
  else {
    if (yNodes[step] > circY) {
      circY+=speed;
    }
    else {
      circY-=speed;
    }
    xReached = false; // this helps prevent a bug where the circle will think it's reached the node before it has
  }
  
  drawShapes();
  
  // move to next node when curent node reached
  if (xReached && yReached) {
    step++;
    xReached = false;
    yReached = false;
  }
  if (step > numNodes-1) {
    step = 0;
  }
    
}

void mouseClicked() {
  // move next node to mouse position
  xNodes[step] = mouseX;
  yNodes[step] = mouseY;
}

void drawShapes() {
  // inner moving circle
  pushMatrix();
  translate(circX, circY);
  ellipse(0, 0, innerSize, innerSize);
  
  // rotating circles
  rotate(radians(2*frameCount));
  ellipse(0, innerSize/2+outerSize/2, outerSize, outerSize);
  ellipse(innerSize/2+outerSize/2, 0, outerSize, outerSize);
  ellipse(0, -1*(innerSize/2+outerSize/2), outerSize, outerSize);
  ellipse(-1*(innerSize/2+outerSize/2), 0, outerSize, outerSize);
  
  popMatrix();
}

