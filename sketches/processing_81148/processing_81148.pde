
float nscale = 0.004; // noise scale for 'connectedness' variable
PVector pv, mouse;
int grid = 10;
int border = 30;
int activeNode;
int c; // counter for when animating
float r; // animation curve
Node nodes[];
boolean mouseClick, animating;

void setup() {
  size(300, 300);
  frameRate(15);
  smooth();
  noiseSeed(int(random(100)));
  noStroke();
  fill(255);
  mouseClick = false;
  animating = false;
  activeNode = -1;

  nodes = new Node[grid*grid];

  for (int x=0; x<grid; x++) {
    for (int y=0; y<grid; y++) {
      pv = new PVector(map(x, 0, grid, border*2, width-border), map(y, 0, grid, border*2, height-border));
      float connectedness = noise(pv.x * nscale, pv.y * nscale);
      nodes[x + y*grid] = new Node(x + y*grid, pv, connectedness);
    }
  }
}

void draw() {
  background(30);
  mouse = new PVector(mouseX, mouseY);

  if (animating) {
    c += 20; // animation speed
    r = (cos(radians(c))+1)/2; // animation calculation
    if (c >= 360) {
      for (Node n:nodes) n.p = new PVector(n.d.x, n.d.y);
      animating = false;
    }
  }

  for (Node n:nodes) n.mouse();
  for (Node n:nodes) n.draw();
}

class Node {
  int id;
  PVector h; // home position
  PVector p; // current position
  PVector d; // animation target destination
  float connectedness;
  boolean selected;
  PVector links[];


  Node(int ID, PVector P, float CON) {
    id = ID;
    p = new PVector(P.x, P.y);
    h = new PVector(P.x, P.y);
    connectedness = CON;
    selected = false;
    links = new PVector[nodes.length];
  }

  void mouse() {
    pv = PVector.sub(p, mouse);
    if (pv.mag() < 8 && mouseClick) {
      mouseClick = false;
      animating = true;
      c = 180; // reset animation counter
      r = 0;
      if (activeNode == id) { // this node is already active so reset grid
        for (Node n:nodes) n.d = new PVector(n.h.x, n.h.y);
        selected = false;
        activeNode = -1;
      }
      else { // Another node is active or none are active
        if (activeNode != -1) {
          nodes[activeNode].selected = false; // another node is active
        }
        selected = true;
        activeNode = id;

        for (Node n:nodes) {
          if (n != this) {
            pv = PVector.sub(n.h, h);
            float m = 1 + abs(connectedness - n.connectedness);
            pv.mult(m);
            pv.add(h);
            n.d = new PVector(pv.x, pv.y);
          }
          else d = new PVector(n.h.x, n.h.y);
        }
      }
    }
  }

  void draw() {
    if (selected) fill(255, 0, 0);
    else fill(255);

    if (!animating) ellipse(p.x, p.y, 5, 5);
    else {
      pv = PVector.sub(d, p);
      pv.mult(r);
      pv.add(p);
      ellipse(pv.x, pv.y, 5, 5);
    }
  }
}

void keyPressed() {
  if (key=='r') setup();
}

void mouseReleased() {
  mouseClick = true;
}
