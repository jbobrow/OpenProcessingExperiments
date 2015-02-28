
int spacing = 40;
int wideCount, highCount;
Node[] nodes;

void setup() {
  size(400, 400);
  colorMode(HSB, 360);
  strokeWeight(3);
  wideCount = (width + 200) / spacing;
  highCount = (height + 200) / spacing;
  nodes = new Node[(wideCount * highCount) + 100];
  
  int i = 0;
  for(int x = -100; x < width + 100; x += spacing) {
    for(int y = -100; y < height + 100; y += spacing) {
      nodes[i] = new Node(x, y);
      i++;
    }
  } 
}

void draw() {
  background(0);
  for(int i = 0; i < wideCount * highCount; i++) {
    nodes[i].attract();
    makeLines(i);
  }
}

void makeLines(int i) {
  stroke(nodes[i].colorReturn(), 300, 300);
  if(i % highCount < highCount - 1) {
    line(nodes[i].xReturn(), nodes[i].yReturn(), nodes[i+1].xReturn(), nodes[i+1].yReturn());
  }
  if(i < (highCount * wideCount) - highCount) {
    line(nodes[i].xReturn(), nodes[i].yReturn(), nodes[i+highCount].xReturn(), nodes[i+highCount].yReturn());
  }
}

class Node {
  
  int xdefault;
  int ydefault;
  int xpos;
  int ypos;
  int boundary;
  float easing;
  int c;
  
  Node(int _xpos, int _ypos) {
    xdefault = _xpos;
    ydefault = _ypos;
    xpos = _xpos;
    ypos = _ypos;
    boundary = 100;
    easing = 5.0;
    c = 100;
  }
  
  void attract() {
    if(dist(xdefault, ydefault, mouseX, mouseY) > boundary || dist(xpos, ypos, mouseX, mouseY) > boundary) {
      xpos += int(random(-2, 2));
      ypos += int(random(-2, 2));
      c = (c + 1) % 360;
    }
    else {
      xpos = int(xpos + (xdefault - xpos) / easing);
      ypos = int(ypos + (ydefault - ypos) / easing);
    }
  }
  
  void display() {
    point(xpos, ypos);
  }
  
  int colorReturn() {
    return c;
  }
  
  int xReturn() {
    return xpos;
  }
  
  int yReturn() {
    return ypos;
  }
  
}

