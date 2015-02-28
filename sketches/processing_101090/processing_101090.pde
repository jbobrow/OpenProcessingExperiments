
int distance = 50;
int screenSize = 400;
int numberOfNodes = 50;
float maxSpeed = 0.5;
Node[] nodes = new Node[numberOfNodes];

void setup() {
  size(screenSize,screenSize);
  smooth();
  for (int i = 0; i < nodes.length; i ++) {
    nodes[i] = new Node(random(screenSize), random(screenSize), random(maxSpeed), random(-1,1), random(-1,1));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < nodes.length; i ++ ) {
    nodes[i].move();
    nodes[i].display();
  }
}

class Node {
  float xpos;
  float ypos;
  float speed;
  float rise;
  float run;
  
  Node(float xpos_, float ypos_, float speed_, float rise_, float run_) {
    xpos = xpos_;
    ypos = ypos_;
    speed = speed_;
    run = run_;
    rise = rise_;
  }
  
  void display() {
    noStroke();
    fill(0,0,0,30);
    fill(0,0,0,30);
    ellipse(xpos, ypos, 10, 10);
    for (int i = 0; i < nodes.length; i ++) {
      if (abs(xpos - nodes[i].xpos) < distance && abs(ypos - nodes[i].ypos) < distance) {
        float strokeWeight = (abs(xpos - nodes[i].xpos) + abs(ypos - nodes[i].ypos)) / 2;
        stroke(0, distance - strokeWeight);
        line(xpos, ypos, nodes[i].xpos, nodes[i].ypos); 
      }
    }
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
}
