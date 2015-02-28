
// constants and attributes
int outerWidth = 16;
int innerWidth = 8;
int numNodes = 10; // initial number of nodes

int maxDistance = 100; // distance at which line is drawn to cursor
float easing = 20.0; // speed of attraction to cursor

boolean alligned = false; // are the nodes alligned to a grid?
int columns = 8; // number of columns to form in grid

float noiseScale = 0.02;

ArrayList nodes;
PGraphics noiseBackground;

void setup() {
  size(400, 400);
  frameRate(30);
  smooth();
  ellipseMode(CENTER);
  noCursor();

  // initialize node objects
  nodes = new ArrayList();
  for (int i = 0; i < numNodes; i++) {
    nodes.add(new Node(int(random(width)), int(random(height)), 
    innerWidth, outerWidth, maxDistance, easing, i, noiseScale));
  }

}

void draw() {
  background(255);
  runNodes();
  displayCursor();
}



void runNodes() {
  for (int i = nodes.size() - 1; i >= 0; i--) {
    Node node = (Node) nodes.get(i);
    if (!alligned) {
      node.move();
      node.getDistance(mouseX, mouseY);
      node.follow(mouseX, mouseY);
    }
    else {
      node.getDistance(mouseX, mouseY);
      node.follow(mouseX, mouseY);
      node.allign(columns);
    }
    node.getDistance(mouseX, mouseY);
    node.displayLine(mouseX, mouseY);
    node.display();
  }
}


void displayCursor() {
  stroke(255, 50, 10);
  strokeWeight(2);
  fill(255);
  ellipse(mouseX, mouseY, 20, 20);
  fill(255, 100, 10);
  ellipse(mouseX, mouseY, 10, 10);
}


void keyPressed() { 
  // add new nodes
  if (key == '=') {
    // println("return key pressed");
    if (nodes.size() < columns * columns) {
      nodes.add(new Node(int(random(width)), int(random(height)), 
      innerWidth, outerWidth, maxDistance, easing, nodes.size(), noiseScale));
    }
  }
  // remove nodes
  else if (key == '-' && !nodes.isEmpty()) {
    // println("delete key pressed");
    int i = nodes.size() - 1;
    nodes.remove(i);
  }
  // set or unset grid allignment 
  else if (key != BACKSPACE && key != RETURN && key != ENTER) {
    alligned = !alligned;
  }
}

class Node {

  PVector pos;
  PVector vel = new PVector(0, 0);
  int innerWidth;
  int outerWidth;
  float distance; // distance between node and cursor
  int maxDistance; // distance from cursor at which node attatches
  float easing; // speed of attraction to cursor
  boolean collected; // true if node is attatched to cursor
  int index; // unique index number of node
  int velocityLimit = 10;
  float noiseScale;
  int counter = 20;
  int alpha = 255;
  int col = 8;
  int xGrid, yGrid;

  Node(int _x, int _y, int iw, int ow, int md, float ease, int i, float ns) {
    pos = new PVector(_x, _y);    
    innerWidth = iw;
    outerWidth = ow;
    maxDistance = md;
    distance = maxDistance + 1;
    easing = ease;
    collected = false;
    index = i;
    xGrid = index % col;
    yGrid = int(index / col);
    noiseScale = ns;
  }

  float x() {
    return pos.x;
  }

  float y() {
    return pos.y;
  }

  void display() {
    alphaControl();
    stroke(0, alpha);
    strokeWeight(1);
    fill(255, alpha);
    ellipse(pos.x, pos.y, outerWidth, outerWidth);
    fill(0, alpha);
    ellipse(pos.x, pos.y, innerWidth, innerWidth);
  }

  // calculate distance to cursor
  // may return distance if desired
  void getDistance(int inputX, int inputY) {
    distance = dist(inputX, inputY, pos.x, pos.y);
    if (distance <= maxDistance) collected = true;
  }

  // draw line between node and cursor
  void displayLine(int inputX, int inputY) {
    if (distance <= maxDistance) {
      stroke(0);
      strokeWeight(map(distance, 0, maxDistance, 10, 0.1));
      line(inputX, inputY, pos.x, pos.y);
    }
    else if (collected) {
      stroke(0);
      strokeWeight(0.1);
      line(inputX, inputY, pos.x, pos.y);
    }
  }

  // move toward cursor if outside maximum distance
  void follow(int inputX, int inputY) {
    if (collected) {
      if (distance > maxDistance * 2) collected = false;
      else if (distance > maxDistance) {
        pos.x = int(pos.x + (inputX - pos.x) / easing);
        pos.y = int(pos.y + (inputY - pos.y) / easing);
      }
    }
  }

  // controls movement of node other than that caused by cursor
  void move() {

    // change velocity based on noise coordinates
    vel.x += lerp(-1, 1, noise((pos.y) * noiseScale));
    vel.y += lerp(-1, 1, noise((pos.x) * noiseScale));
    vel.x = constrain(vel.x, -velocityLimit, velocityLimit);
    vel.y = constrain(vel.y, -velocityLimit, velocityLimit);

    // update position
    pos.add(vel);

    // constrain position to screen
    if (pos.x < -0.5 * maxDistance || pos.x > width + maxDistance / 2 ||
      pos.y < -0.5 * maxDistance || pos.y > height + maxDistance / 2) {
      vel.x = 0;
      vel.y = 0;
      pos.x = int(random(width));
      pos.y = int(random(width));
      counter = 0;
    }
  }

  // allign to grid
  void allign() {
    collected = false;
    int newX = xGrid * (width / col) + (width / col / 2);
    int newY = yGrid * (height / col) + (height / col / 2);
    pos.x = pos.x + (newX - pos.x) / 3.0;
    pos.y = pos.y + (newY - pos.y) / 3.0;
  }
  
  void alphaControl() {
    if (counter <= 20) counter++;
    alpha = int(map(counter, 0, 20, 0, 255));
  }
}



