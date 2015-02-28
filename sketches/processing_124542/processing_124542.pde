
Node tree;
int max_fanout = 3; // maximum node fanout
int max_level = 3; // maximum tree depth
int span = 50;
int jump = 2;


void setup() {
 size(500, 500);
 tree = new Node(width/2, height/2, 1, 3, 0, 0);
}

void draw() {
   background(255);
  tree.picture();
  tree.update();
}

void mouseReleased() {
   tree = new Node(width/2, height/2, 1, 3, 0, 0);
} 

class Node {
  
  float x, y; // node positions
  int level; // node level
  int fanout; // node fanout
  float angle, radius; // node polar coordinates wrt parent node
  float rotation; // node rotation speed
  Node[] children; // list of children
  
  Node(float _x, float _y, int _level, int _fanout, float _angle, float _radius) {
    x = _x;
    y = _y;
    level = _level;
    fanout = _fanout;
    angle = _angle;
    radius = _radius;
    rotation = radians(random(-1, 1));
    
    children = new Node[fanout];
    for (int i = 0; i < fanout; i++) {
      int clevel = level + 1;
      int cfanout;
      if (level < (max_level - 1)) { // node with internal children
        cfanout = max_fanout; 
      } else { // node with leaf children
        cfanout = 0; 
      }
      float cradius = random(50, width/3); 
      float cangle = random(0, TWO_PI);
      float cx = x + cos(cangle) * cradius;
      float cy = y + sin(cangle) * cradius;
      children[i] = new Node(cx, cy, clevel, cfanout, cangle, cradius);
    }
    
  }
    
  void picture() {
    for (int i = 0; i < fanout; i++) {
      if (level > 0) {
        fill(0);
        stroke(0);
        strokeWeight(5 / level);
        ellipse(x, y, 20 / level, 20 / level); // draw node
        if (level == (max_level - 1)) { 
          ellipse(children[i].x, children[i].y, 20 / (level+1), 20 / (level+1)); // draw node
        }
        line(x, y, children[i].x, children[i].y); // draw edge
      }
      children[i].picture();
    }
  }
  
  void update() {
    for (int i = 0; i < fanout; i++) {
      children[i].angle += children[i].rotation; 
      children[i].x = x + cos(children[i].angle) * children[i].radius;
      children[i].y = y + sin(children[i].angle) * children[i].radius;
      children[i].update();
    }



    
  }

  
}



