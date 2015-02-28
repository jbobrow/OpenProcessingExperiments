
// Tree Orb 2D
// last update: 2012-11-07
// Gweltaz Duval-Guennoc (gweltou@hotmail.com)


int MAX_CIRCLE = 16;

Orb orb;

int[] random_divisions;

ArrayList<Handle> handles;  // handles for control circles
Handle active_handle = null;

PVector orig;  // center point for drawing the orb

boolean div_mode = false;  // if true divide number of nodes on active level when number is typed, multiply otherwise
boolean edit_mode = true;  // draw controls (circles, handles and text) if true


void setup() {
  size(500, 500);
  noLoop();
  
  // initialize font
  font = createFont("Arial", 16, true);
  textFont(font, 45);
  
  // define center
  orig = new PVector((width/2)-1, (height/2)-1);
  
  // create tree orb
  orb = new Orb(orig);
  
  // generate random division values
  int n = int(random(3, 6));  // number of levels in orb
  int p = int(random(2, 6));  // random number to calculate number of nodes per level
  random_divisions = new int[n];
  for (int i=0; i<n; i++) {
    NodeLevel level = orb.newLevel();
    orb.multiplyLevel(level, p, div_mode);
  }
  
  // initialize handle list
  handles = new ArrayList<Handle>();
  int radius = 0;
  for (int i=0; i<n; i++) {
    radius += int(random(width/(2*orb.levels.size())));
    handles.add(new Handle(orb.levels.get(i), radius, -random(PI)));
    handles.get(i).updateLevel();
  }
}


void draw() {
  background(255);
  translate(orig.x, orig.y);
  
  orb.draw();
  
  if (edit_mode) {
    drawControls();
    if (active_handle != null) {
      fill(active_handle.filling);
      textAlign(LEFT, TOP);
      text(str(active_handle.level.nGroups), active_handle.coord.x, active_handle.coord.y);
    }
  }
}


void keyPressed() {
  if (key == 'p') {
    background(255);
    orb.draw();
    saveFrame("TreeGraph-Orb_###.png");
  } else if (key == 'e') {  // activate or deactivate edit mode
    edit_mode = !edit_mode;
  } else if (key == '/') {  // divide nodes on current level
    div_mode = true;
  } else if (key == '*') {  // multiply nodes on current level
    div_mode = false;
  } else if (key == '+') {  // add a new outer level
    if (orb.levels.size() <= MAX_CIRCLE) {
      int radius = orb.levels.get(orb.levels.size()-1).radius + 20;
      float theta = atan2(mouseY-orig.y, mouseX-orig.x);
      Handle newHandle = new Handle(orb.newLevel(), radius, theta);
      handles.add(newHandle);
      newHandle.updateLevel();
      active_handle.active = false;
      active_handle = newHandle;
      active_handle.active = true;
    }
  } else if (key == '-') { // remove last level in array
    if (orb.levels.size() > 1) { 
      orb.removeLevel();
      handles.remove(handles.size()-1);
      active_handle = null;
    }
  } else if (key > '1' && key <= '9' && active_handle != null) { // number to multiply/divide nodes, ignore values 0 and 1
    int number = key - '0'; 
    NodeLevel level = active_handle.level;
    orb.multiplyLevel(level, number, div_mode);
  }
  
  redraw();
}


void mousePressed() {
  /* activate a handle if nearby, deactivate all others
  */
  active_handle = null;
  for (int i=0; i<handles.size(); i++) {
    Handle handle = handles.get(i);
    if (abs(mouseX-orig.x-handle.coord.x) < handle.r && abs(mouseY-orig.y-handle.coord.y) < handle.r) {
      handle.active = true;
      active_handle = handle;
    } else
      handle.active = false;
  }
  if (edit_mode == false)
    edit_mode = true;
  
  redraw();
}


void mouseDragged() {
  /* move handles
  */
  if (active_handle != null) {
    active_handle.radius = int(PVector.dist(orig, new PVector(mouseX, mouseY)));
    active_handle.theta = atan2(mouseY-orig.y, mouseX-orig.x);
    active_handle.updateLevel();  // update radius and angle values of attached level
  }
  
  redraw();
}


void drawControls() {
  /* draw handles and control circles
  */
  ellipseMode(RADIUS);
  for (int i=0; i<handles.size(); i++) {
    noFill();
    strokeWeight(2);
    stroke(malachite[i % malachite.length], 160);
    
    ellipse(0, 0, handles.get(i).radius, handles.get(i).radius);  // control circle
    handles.get(i).draw();  // handle
  }
}
// Tree Orb 2D
// last update: 2012-11-07
// Gweltaz Duval-Guennoc (gweltou@hotmail.com)


class Orb {
  ArrayList<NodeLevel> levels;
  PVector orig;
  int maxNodes;  // maximum number of nodes on any level
  PVector[] path;
  
  Orb(PVector orig) {
    this.levels = new ArrayList<NodeLevel>();
    this.orig = orig;
  }
  
  void updateMaxNodes() {
    /* find the maximum number of nodes on any level
    */
    int max = 0;
    for (int i=0; i<this.levels.size(); i++) {
      if (this.levels.get(i).nGroups > max)
        max = this.levels.get(i).nGroups;
    }
    this.maxNodes = max;
  }
  
  NodeLevel newLevel() {
    /* add a new outer level
    ** the new level should have the same number of node as the preceding one (or 1 if none)
    ** returns: <NodeLevel> level created
    */
    int n = 1;
    if (this.levels.size() > 0)
      n = this.levels.get(this.levels.size()-1).nGroups;
    
    NodeLevel level = new NodeLevel(n);
    this.levels.add(level);
    this.updateMaxNodes();
    
    // resize path array
    this.path = new PVector[this.levels.size()+1];  // num levels + origin point
    this.path[0] = new PVector(0, 0);
    
    return level;
  }
  
  void removeLevel() {
    if (this.levels.size() > 0) {
      this.levels.remove(this.levels.size()-1);
      this.updateMaxNodes();
      
      // resize path array
      this.path = new PVector[this.levels.size()+1];  // num levels + origin point
      this.path[0] = new PVector(0, 0);
    }
  }
  
  void multiplyLevel(NodeLevel level, int n, boolean div_mode) {
    /* multiply by n number of nodes on given level
    ** <NodeLevel> level: level in array
    ** <int> n: multiplying factor
    ** <boolean> div_mod : if true, divide instead of multiplying
    */
    int i = this.levels.indexOf(level);
    
    int prevLevel = 1;
    if (i > 0) prevLevel = this.levels.get(i-1).nGroups;
    int nextLevel = 1;
    if (i < this.levels.size()-1) nextLevel = this.levels.get(i+1).nGroups;
    
    int propNum;
    if (div_mode) {
      if (level.nGroups % n == 0)
        propNum = level.nGroups / n;
      else return;
    } else {
      propNum = level.nGroups * n;
    }
    
    if (divOrMult(propNum, prevLevel) && divOrMult(propNum, nextLevel) && divOrMult(propNum, this.maxNodes)) {
      level.setNumGroups(propNum);
      this.updateMaxNodes();
    }
  }
  
  void updatePath(int index) {
    for (int i=0; i<this.levels.size(); i++) {
      int step = this.maxNodes / this.levels.get(i).nGroups;
      if (index%step == 0)
        this.path[i+1] = this.levels.get(i).nextNode();  // skips path[0] (for orig)
    }
  }
  
  void draw() {
    /* draw orb around center point orig
    */
    noFill();
    strokeWeight(1);
    int alpha = max(40, 255 - 2*this.maxNodes);
    stroke(#58300B, alpha);
    
    for (int i=0; i<maxNodes; i++) {
      this.updatePath(i);
      pathCurve(this.path);
    } 
  }
}


class NodeLevel {
  float theta;      // angle shift for whole node level
  int radius;
  int nGroups;      // number of node groups in level
  int npGroup;      // number of nodes per group
  float aSizeGroup; // size of a single group (radian)
  int index;
  
  NodeLevel(int n) {
    this.index = 0;
    this.setGroup(1);  // a single point per group
    this.setNumGroups(n);
  }
  
  void setGroup(int n) {
    this.npGroup = n;
  }
  
  void setNumGroups(int n) {
    /* set number of node groups
    */
    this.nGroups = n;
    this.aSizeGroup = TWO_PI / n;
  }
  
  PVector nextNode() {
    int nGroup = index / this.npGroup;
    float angle = this.theta + this.aSizeGroup * (nGroup + (index%this.npGroup) / this.npGroup);
    float x = this.radius * cos(angle);
    float y = this.radius * sin(angle);
    
    this.index++;
    if (this.index >= this.nGroups)
      this.index = 0;
    
    return new PVector(x, y);
  }
}


void pathCurve(PVector[] path) {
  /* Draw a curve from an array of PVectors
  ** <PVector>[] path: Array of an arbitrary number of PVectors
  */
  //curveTightness(0.0);
  beginShape();
  curveVertex(path[0].x, path[0].y);  // start anchor point
  int i;
  for (i=0; i<path.length; i++) {
    curveVertex(path[i].x, path[i].y);
  }
  i--;
  curveVertex(path[i].x, path[i].y);  // end anchor point
  endShape();
}


boolean divOrMult(int a, int b) {
  /* check if 'a' is a divisor or a multiplicator of 'b'
  */
  return a%b == 0 || b%a == 0;
}
// Tree Orb 2D
// last update: 2012-11-07
// Gweltaz Duval-Guennoc (gweltou@hotmail.com)


color[] malachite = {#1A7957, #253C34, #002417, #49B790, #63B79A};
color[] malachite_complementary = {#F19F32, #D9963E, #CF8522, #F6B156, #F6BD71};

PFont font;


class Handle {
  NodeLevel level;  // level attached to this handle
  float theta;      // angular position
  int radius;       // radius of control circle
  PVector coord;
  int r;            // radius of handle widget
  color filling;
  color border;
  boolean active;
  
  Handle(NodeLevel level, int radius, float theta) {
    this.level = level;
    this.radius = radius;
    this.theta = theta;
    
    this.r = 6;
    int i = int(random(10));
    this.filling = malachite_complementary[i % malachite_complementary.length];
    this.border = malachite[i % malachite.length];
    
    this.active = false;
  }
  
  void update() {
    /* update coordinates
    */
    float x = this.radius * cos(this.theta);
    float y = this.radius * sin(this.theta);
    this.coord = new PVector(x, y);
  }
  
  void updateLevel() {
    /* update radius and angle values of attached level
    */
    this.level.radius = this.radius;
    this.level.theta = this.theta;
  }
  
  void draw() {
    this.update();
    
    // active handles should be more obvious (greater radius)
    int rd = this.r;
    if (this.active == true)
      rd += 4;
    
    strokeWeight(2);
    stroke(this.border);
    fill(this.filling);
    ellipseMode(RADIUS);
    ellipse(this.coord.x, this.coord.y, rd, rd);
  }
}


