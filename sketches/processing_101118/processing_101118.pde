
int distance = 100;
int screenSize = 800;
int numberOfNodes = 100;
int bgColor = 255;
int ellipseColor = 0;
boolean freakOutToggle = false;
Node[] nodes = new Node[numberOfNodes];

void setup() {
  size(screenSize,screenSize);
  frameRate(30);
  for (int i = 0; i < nodes.length; i ++) {
    nodes[i] = new Node(random(screenSize), random(screenSize), random(1.0), random(-1,1), random(-1,1));
  }
}

boolean sketchFullScreen() {
  return true;
}

void draw() {
  background(bgColor);
  for (int i = 0; i < nodes.length; i ++ ) {
    nodes[i].move();
    nodes[i].display();
    if (random(100) < 3) {
      nodes[i].freakOut();
    } else if (freakOutToggle) {
      nodes[i].freakOut();
    }
  }
}

void mousePressed() {
  if (bgColor == 255) {
    bgColor = 0;
    ellipseColor = 255;
  }
  freakOutToggle = true;
  for (int i = 0; i < nodes.length; i ++ ) {
    nodes[i].freakOut();
    nodes[i].display();
  }
}

void mouseReleased() {
  if (bgColor == 0) {
    bgColor = (255);
    ellipseColor = 0;
  }
  freakOutToggle = false;
}

class Node {
  float xpos;
  float ypos;
  float speed;
  float rise;
  float run;
  int counter;
  float health;
  
  Node(float xpos_, float ypos_, float speed_, float rise_, float run_) {
    xpos = xpos_;
    ypos = ypos_;
    speed = speed_;
    run = run_;
    rise = rise_;
    health = 100;
  }
  
  void display() {
    counter = 0;
    for (int i = 0; i < nodes.length; i ++) {
      if (abs(xpos - nodes[i].xpos) < distance && abs(ypos - nodes[i].ypos) < distance) {
        counter ++;
        float strokeWeight = (abs(xpos - nodes[i].xpos) + abs(ypos - nodes[i].ypos)) / 2;
        stroke(ellipseColor, distance - strokeWeight);
        line(xpos, ypos, nodes[i].xpos, nodes[i].ypos); 
      }
    }
    noStroke();
    fill(ellipseColor,10 * (counter + 1));
    ellipse(xpos, ypos, 10, 10);
  }
  
  void move() {
    xpos = xpos + (speed * run);
    ypos = ypos + (speed * rise);
    if (xpos > width) {
      xpos = 0;
    } else if (ypos > height) {
      ypos = 0;
    } else if (xpos < 0) {
      xpos = width;
    } else if (ypos < 0) {
      ypos = height;
    } 
    
  }

  void freakOut() {
    xpos = xpos + random(-20, 20);
    ypos = ypos + random(-20, 20);
    if (xpos > width) {
      xpos = 0;
    } else if (ypos > height) {
      ypos = 0;
    } else if (xpos < 0) {
      xpos = width;
    } else if (ypos < 0) {
      ypos = height;
    } 
  }
}

