
Tree tree, smallTree;
float angle =0;
int selectedPalette = 1; //0 = random, 1 = red, 2 = yellow, 3 = blue
int selectedType = 1;    //0 = curve, 1 = rect, 2 = one branch, 3 = all branches
float tightness =-5;
float dt =0.07;
boolean varyTightness = true;
int hue;
int treeHeight = 7;
PVector[] buttons; // coordinates of height buttons

void setup() {
  size(696, 600); //width is a multiple of 8
  smooth();
  colorMode(HSB, 360, 100, 100, 100);
  hue = floor(random(360));
  makeNewTrees();
  tree.update(angle);
  smallTree.update(angle); 
  PFont pf = loadFont("Helvetica-Bold-14.vlw");
  textFont(pf, 14);
  textAlign(CENTER, CENTER);
  buttons = new PVector[8];
  for (int i = 0; i<buttons.length; i++) {
    buttons[i] = new PVector(5*width/8+(i+1)*3*width/72, height-30);
  }
}

void draw() {
  background(0);
  if (varyTightness) {
    tightness += dt;
    if (tightness > 5 || tightness <-5) 
      {dt = -dt; }
  } 
  if (selectedType<2) {
    tree.redraw(selectedType, true, 2, tightness);
  } else {
    tree.redraw(selectedType, false, 2, tightness);
  }
  redrawSmallTrees();
  redrawNewColor();
  redrawDepthButtons();
  float mx = mouseX;
  float my = mouseY;
  if (my > 500 && mx<5*width/8) { //handle menu choice
    int left = width/8*floor(8*mx/width);
    noStroke();
    fill(255, 50);
    rect(left, 520, width/8, 80); //hover effect
    if (mousePressed) {
      left = 8*left/width;
      if (left<4) {
        selectedType = left;
      } else if (left == 4) {
        hue = floor(random(360));
        tree.setHue(hue);
        smallTree.setHue(hue);
      }
    }
  } 
  angle = (angle+0.02)%TWO_PI;
  tree.update(angle);
  smallTree.update(angle);
}

void mouseClicked() {
  float mx = mouseX;
  float my = mouseY;
  if (my<500) {
    varyTightness = !varyTightness;
    if (!varyTightness) {
      tightness = 0; 
    } 
  } else {
    for (int i=0; i<buttons.length; i++) {
      if (dist(buttons[i].x, buttons[i].y, mx, my)<20) {
        treeHeight = 1+i;
        makeNewTrees();
      }
    }
  }
}

void makeNewTrees() {
  PVector p1, p2;
  p1 = new PVector(width/2-40, 0.7*height+10);
  p2 = new PVector(width/2+40, 0.7*height+10);
  tree = new Tree(p1, p2, treeHeight, hue);
  p1 = new PVector(-width/16-10, 582);
  p2 = new PVector(-width/16+10, 582);
  smallTree = new Tree(p1, p2, 1, hue);
}

void redrawSmallTrees() {
  stroke(100);
  strokeWeight(2);
  line(0, 500, width, 500);
  line(width/2, 500, width/2, height);
  line(5*width/8, 500, 5*width/8, height);
  fill(255);
  text("Select tree type", 0.25*width, 510);
  fill(255,20);
  rect(selectedType*width/8, 520, width/8, 80);  //mark the selected choices
  pushMatrix();
  for (int i = 0; i<4; i++) {
    translate(width/8, 0);
    if (i<2) {
      smallTree.redraw(i, true, 2, tightness);
    } else {
      smallTree.redraw(i, false, 2, tightness);
    }
  }
  popMatrix();
}

void redrawNewColor() {
  noStroke();
  fill(255);
  text("New colour", 0.5625*width, 510);
  for (int i = 0; i<8; i++) {
    fill(hue+i*10, 80, 80);
    rect(0.5625*width-5,height-10*i-10, 10, 10);
  }
}

void redrawDepthButtons() {
  strokeWeight(2);
  stroke(100);
  fill(255);
  text("Height", 0.8125*width, 510);
  for (int i = 0; i<buttons.length; i++) {
    fill(255);
    text((i+1)+"", buttons[i].x,  buttons[i].y-15);
    if (i == treeHeight-1) {
      fill(200);
    } else {
      fill(0);
    }
    ellipse(buttons[i].x, buttons[i].y, 10, 10);
  }
}
  
  
class Node {
  
  PVector[] ar;
  Node left;
  Node right;
  
  Node(PVector p1, PVector p2, float angle) {
    this.ar = new PVector[3];
    this.ar[0] = new PVector(0, 0);
    this.ar[1] = new PVector(0, 0);
    this.ar[2] = new PVector(0, 0);
    update(p1, p2, angle);
    this.left = null;
    this.right = null;
  }
  
  //avoid garbage collection
  void update(PVector p1, PVector p2, float angle) {
    PVector d = new PVector(p2.x-p1.x, p2.y-p1.y);
    ar[0].x = p1.x+d.y;
    ar[0].y = p1.y-d.x;
    ar[1].x = p2.x+d.y;
    ar[1].y = p2.y-d.x;
    PVector mid = new PVector((ar[0].x+ar[1].x)/2, (ar[0].y+ar[1].y)/2 );
    rotate(ar[2], ar[0], mid, angle);
  }
  
  //rotates rotP an angle ang around p and stores the result i tarP
  void rotate(PVector tarP, PVector p, PVector rotP, float ang) {
    float dx = rotP.x-p.x;
    float dy = rotP.y-p.y;
    tarP.x = rotP.x+(cos(ang)*dx-sin(ang)*dy);
    tarP.y = rotP.y+(sin(ang)*dx+cos(ang)*dy); 
  }
  
  void redraw() {
    point(ar[0].x, ar[0].y);
    point(ar[1].x, ar[1].y);
    point(ar[2].x, ar[2].y);
  }
  
}
class Tree {
  
  PVector point1, point2;
  Node root;
  int maxHeight;
  color sColor, fColor;
  int hue;
  ArrayList<PVector> path;
  
  Tree(PVector p1, PVector p2, int maxHeight, int hue) {
    this.maxHeight = maxHeight;
    point1 = new PVector(p1.x, p1.y);
    point2 = new PVector(p2.x, p2.y);
    root = makeTree(p1, p2, 0);
    this.hue = hue%360;
  }
  
/*********************************************************/
/* private methods  (sort of)                            */
/*********************************************************/
  
  void makeColors(Node node, int height){
    sColor = color((hue +height*10)%360, 80, 80);
    fColor = color((hue +height*10)%360, 100, 80, 50);
  }
    
  
  Node makeTree(PVector p1, PVector p2, int height) {
    if (height <= maxHeight) {
      Node node = new Node(p1, p2, 0);
      node.left = makeTree(node.ar[0], node.ar[2], height+1);
      node.right = makeTree(node.ar[2], node.ar[1], height+1);
      return node;
    }
    return null;
  }
  
  void update(PVector p1, PVector p2, Node node, float angle, int height) {
    if (height <= maxHeight) {
      node.update(p1, p2, angle);
      update(node.ar[0], node.ar[2], node.left, angle, height+1);
      update(node.ar[2], node.ar[1], node.right, angle, height+1);
    }
  }
  
  void redrawPoints(PVector p1, PVector p2, Node node, int height) {
    if (height <= maxHeight) {
      makeColors(node, height);
      stroke(sColor);
      node.redraw();
      redrawPoints(node.ar[0], node.ar[2], node.left, height+1);
      redrawPoints(node.ar[2], node.ar[1], node.right, height+1);
    }
  }
  
  void redrawRect(PVector p1, PVector p2, Node node, int height, boolean filled) {
    if (height <= maxHeight) {
      makeColors(node, height);
      stroke(sColor);
      if (filled) { fill(fColor); }
      quad(p1.x, p1.y, node.ar[0].x, node.ar[0].y, node.ar[1].x, node.ar[1].y, p2.x, p2.y);
      redrawRect(node.ar[0], node.ar[2], node.left, height+1, filled);
      redrawRect(node.ar[2], node.ar[1], node.right, height+1, filled);
    }
  }
  
  void redrawCurve(PVector p1, PVector p2, Node node, int height, boolean filled) {
    if (height <= maxHeight) {
      makeColors(node, height);
      stroke(sColor);
      if (filled) { fill(fColor); }
      beginShape();
      curveVertex(p2.x, p2.y);
      curveVertex(p1.x, p1.y);
      curveVertex(node.ar[0].x, node.ar[0].y);
      curveVertex(node.ar[1].x, node.ar[1].y);
      curveVertex(p2.x, p2.y);
      curveVertex(p1.x, p1.y);
      endShape();
      redrawCurve(node.ar[0], node.ar[2], node.left, height+1, filled);
      redrawCurve(node.ar[2], node.ar[1], node.right, height+1, filled);
    }
  }
  
  //add the points to the right to the path
  void addFromLastRight(Node node) {
    if (node != null) {
      if (node.left == null ) { //add a last point, it won't be drawn
        path.add(node.ar[2]); 
      } else {
        addFromLastRight(node.right);
      }
      path.add(node.ar[0]);
    }
  }
  
  //add the points to the left to the path
  void addFromFirstLeft(Node node) {
    if (node != null) {
      path.add(node.ar[1]);
      if (node.left == null ) { //add a last point, it won't be drawn
        path.add(node.ar[2]); 
      } else {
        addFromFirstLeft(node.left);
      }
    }
  }
  
  void redrawOnePath(PVector p1, PVector p2, Node node, int height, boolean filled) {
    if (node != null) {
      addFromLastRight(node.right);
      path.add(node.ar[0]);
      path.add(p1);
      path.add(p2);
      path.add(node.ar[1]);
      addFromFirstLeft(node.left);
      makeColors(node, height);
      stroke(sColor);
      if (filled) { fill(fColor); }
      beginShape();
      for (int i=0; i<(path.size()); i++) {
        curveVertex(path.get(i).x, path.get(i).y);
      }
      endShape();
    }
  } 
  
  void redrawAllPaths(PVector p1, PVector p2, Node node, int height, boolean filled) {
    redrawOnePath(p1, p2, node, height, filled);
    if (node != null) {
      path = new ArrayList<PVector>();
      redrawAllPaths(node.ar[0], node.ar[2], node.left, height+1, filled);
      path = new ArrayList<PVector>();
      redrawAllPaths(node.ar[2], node.ar[1], node.right, height+1, filled);
    }
  } 
  
/*********************************************************/
/* public methods    (sort of)                           */
/*********************************************************/

  void update(float angle) {
    update(point1, point2, root, angle, 0);
  }
  
  void setHue(int hue) {
    this.hue = hue%360;
  }
  
  void redrawPoints() {
    point(point1.x, point1.y);
    point(point2.x, point2.y);
    redrawPoints(point1, point2, root, 0);
  }
 
  void redrawRect(boolean filled) {
    if (!filled) {noFill(); }
    redrawRect(point1, point2, root, 0, filled);
  }
  
  void redrawCurve(boolean filled) {
    if (!filled) {noFill(); }
    redrawCurve(point1, point2, root, 0, filled);
  }
  
  void redrawOnePath(boolean filled) {
    if (!filled) {noFill(); }
    path = new ArrayList<PVector>();
    redrawOnePath(point1, point2, root, 0, filled);
  }
  
  void redrawAllPaths(boolean filled) {
    if (!filled) {noFill(); }
    path = new ArrayList<PVector>();
    redrawAllPaths(point1, point2, root, 0, filled);
  }
  
  void redraw(int type, boolean filled, float sWeight, float t) {
    strokeWeight(sWeight);
    curveTightness(t);
    if (type == 0) { 
      redrawRect(filled); 
    } else if (type == 1) {
      redrawCurve(filled); 
    } else if (type == 2){
      redrawPoints();
      redrawOnePath(filled);
    } else {
      redrawAllPaths(filled);
    }
  }
  
}


