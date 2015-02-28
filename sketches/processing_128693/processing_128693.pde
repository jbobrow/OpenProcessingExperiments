
Node tree;
int fanout = 3; // maximum node fanout
int max_level = 5; // maximum tree depth
int span = 50;
int jump = 2;

void setup() {
 size(500, 500);
 mouseReleased();
}

void draw() {
  background(255);
  tree.draw(width/2, height/2, 1);
  tree.update();
}

void mouseReleased() {
   tree = new Node(1);
} 

class Node {
  float angle, radius; // node polar coordinates wrt parent node
  float rotation; // node rotation speed
  Node[] children; // list of children
  
  Node(int _level) {
    angle = random(0, TWO_PI);
    radius = random(50, width / 3) / (_level - 1);
    rotation = (_level) * radians(random(-1, 1)) / 2.0;
    
    if(_level == max_level) {
      children = new Node[0];
      return;
    }
    
    children = new Node[fanout];
    for (int i = 0; i < fanout; i++) {
      children[i] = new Node(_level + 1);
    }
  }
    
  void draw(float _x, float _y, int _level) {
    fill(0);
    stroke(0);
    ellipse(_x, _y, 20 / _level, 20 / _level); // draw node
    for (int i = 0; i < children.length; i++) {
      strokeWeight(5 / _level);
      float cx = _x + children[i].radius * cos(children[i].angle);
      float cy = _y + children[i].radius * sin(children[i].angle);
      line(_x, _y, cx, cy); // draw edge
      children[i].draw(cx, cy, _level + 1);
    }
  }
  
  void update() {
    angle += rotation;
    for (int i = 0; i < children.length; i++) {
      children[i].update();
    }
  }
}

