
/*
 * Quasicrystals
 * Author: Karl Hiner
 * CS350, Winter 2012
 *
 * Mess with the display controls,
 * Choose from 5-, 7-, 9-, or 11-fold symmetry
 * Click and drag the vector arrows in the upper left
 * to manually change the orientation of the symmetry,
 * or click 'Play' button to automate the orientation changes
 */
import controlP5.*;

final static int NO_COLOR = 0;
final static int GRAY1 = 1;
final static int GRAY2 = 2;

float SCALE = 10;
Vector SCROLL = new Vector();

int N = 50;
int SYMMETRY = 7;
int colorMode = GRAY1;
boolean playing = false;
boolean outlines = true;
boolean tiles = true;
boolean lines = false;

int[] index;
Vector[] vectors;
float[][] intercepts;
Vector currInt = null;
VectorSelector vectorSelector;
Vector mouseVec = new Vector();
ControlP5 controlP5;

void setup() {
  size(800, 600, P2D);
  colorMode(RGB, 1);
  vectorSelector = new VectorSelector();
  // mouse wheel for scaling
  addMouseWheelListener(new java.awt.event.MouseWheelListener() {  
    public void mouseWheelMoved(java.awt.event.MouseWheelEvent evt) {
      if (evt.getWheelRotation() < 0) {
        if (SCALE < 50)
          SCALE += evt.getScrollAmount();
      }
      else {
        if (SCALE > 7)
          SCALE -= evt.getScrollAmount();
      }
    }
  });
  controlP5 = new ControlP5(this);
  ControlGroup controlGroup = controlP5.addGroup("controls", 5, 15, 110)
                                       .setBackgroundColor(color(.5, .8)) // semi-transparant gray background
                                       .setBackgroundHeight(100);
  controlP5.addButton("play", 0, 3, 5, 45, 18).setGroup(controlGroup)
                                              .captionLabel().style().marginLeft = 6;
  DropdownList symList = controlP5.addDropdownList("symmetry", 3, 40, 45, 50)
                                  .setBarHeight(10)
                                  .setItemHeight(10)
                                  .setGroup("controls")
                                  .setLabel("SYM: " + SYMMETRY);

  symList.addItem("5", 5);
  symList.addItem("7", 7);
  symList.addItem("9", 9);
  symList.addItem("11", 11);
  DropdownList colorList = controlP5.addDropdownList("colors", 55, 60, 50, 40)
                                    .setBarHeight(10)
                                    .setItemHeight(10)
                                    .setGroup("controls")
                                    .setLabel("gray 1");
  colorList.addItem("no color", NO_COLOR);
  colorList.addItem("gray 1", GRAY1);
  colorList.addItem("gray 2", GRAY2);
  setupToggle("tiles", tiles, 55, 5);
  setupToggle("outlines", outlines, 55, 20);
  setupToggle("lines", lines, 55, 35);
  reset();
}

void reset() {
  vectorSelector.initAngles();
  index = new int[SYMMETRY];
  vectors = new Vector[SYMMETRY];
  intercepts = new float[SYMMETRY][N];
}

void setupToggle(String name, boolean flag, int x, int y) {
  controlP5.addToggle(name, flag, x, y, 10, 10)
           .setGroup("controls")
           .captionLabel().style().marginLeft = 15;
  controlP5.controller(name).captionLabel().style().marginTop = -12;
}

// main draw method
void draw() {
  setupDraw(); // get things ready
  pushMatrix();
  scale(SCALE); // scale appropriately based on mouse scrolling
  Vector centerVec = getTileVector(SYMMETRY/2, SYMMETRY/2 + 1, N/2, N/2);  
  if (centerVec != null) // translate to center vector for stable look
    translate(-centerVec.x + width/20 + SCROLL.x, -centerVec.y + height/20 + SCROLL.y);
  if (tiles)
    drawTiles();
  if (lines)
    drawLines();
  popMatrix();
  
  vectorSelector.draw();
  controlP5.draw(); // since we are using P2D, need to manually draw controllers
}

// call this method before each draw to compute everything for next frame
void setupDraw() {
  background(1); // white background 
  if (outlines)
    stroke(0);
  else
    noStroke();
  if (playing) {
    // automate rotation of vectors by adding diff values to their angles
    for (int i = 0; i < SYMMETRY; i++) {
      vectorSelector.addToAngle(i, 0.02f*(i + 1));
    }
  }
  setIntercepts();
}

// find y-intercepts of all lines based on the current
// orientation of vectors
void setIntercepts() {
  for (int i = 0; i < SYMMETRY; i++)
    setIntercept(i, vectorSelector.getAngle(i));
}

// initialize the vector at index i with the given angle phi, and
// find the y-intercepts of all lines oriented int the direction
// of the vector
void setIntercept(int i, float phi) {
  vectors[i] = new Vector(cos(phi), sin(phi));
  Vector norm = vectors[i].getNormal();
  for (int n = 0; n < N; n++) {
    float offset = (n - N/2);
    float x1 = vectors[i].x + norm.x*offset + i;
    // the *1.4 is an arbitrary offset to ensure no more than two
    // lines intersect at any point
    float y1 = vectors[i].y + norm.y*offset + i*1.4;
    intercepts[i][n] = y1 - vectors[i].slope*x1;
  }
}

/** 
 * Draw the lines which the tiling is generated from.
 */
void drawLines() {
  stroke(color(1, 0, 0));
  for (int vec_index = 0; vec_index < SYMMETRY; ++vec_index) {
    for (int n_index = 0; n_index < N; n_index++) {
      float b = intercepts[vec_index][n_index];
      line(-width/2, -width/2*vectors[vec_index].slope + b, width/2, width/2*vectors[vec_index].slope + b);
    }
  }
}

/**
 * Draw all tiles
 */
void drawTiles() {
  for (int t1 = 0; t1 < SYMMETRY; t1++)
    for (int t2 = t1 + 1; t2 < SYMMETRY; t2++)
      for (int n1 = 0; n1 < N; n1++)
        for (int n2 = 0; n2 < N; n2++) {
          Vector v = getTileVector(t1, t2, n1, n2);
          if (v != null)
            drawTile(v, t1, t2);
        }
}

Vector getTileVector(int t1, int t2, int n1, int n2) {
  // find the intersection of n1'th t1 line and the n2'th t2 line
  // two lines y1 = a1 + b1x and y2 = a2 + b2x intersect at:
  // xi = -(a1 - a2)/(b2 - b1), yi = a1 + b1*xi
  float xi = -(intercepts[t1][n1] - intercepts[t2][n2])/
    (vectors[t1].slope - vectors[t2].slope);
  float yi = intercepts[t1][n1] + vectors[t1].slope*xi;
  Vector intersect = new Vector(xi, yi);
  boolean flag = false;
  for (int i = 0; i < SYMMETRY; i++) {
    if (i != t1 && i != t2) {
      index[i] = ceil(vectors[i].minDistToPoint(intersect, intercepts[i][0]));
      if (index[i] > N || index[i] < 1)
        flag = true;
    }
  }
  if (!flag) {
    index[t1] = n1; 
    index[t2] = n2;
    Vector v = new Vector();
    for (int i = 0; i < SYMMETRY; i++)
      v.add(vectors[i].getScaled(index[i]));

    // compute color (currently only grayscale)
    float c = 0.0;
    if (colorMode != NO_COLOR) {
      for (int i = 0; i < SYMMETRY; i++)
        c += index[i];
      while (c > SYMMETRY)  
        c -= SYMMETRY;
      c /= SYMMETRY;
      if (colorMode == GRAY2) {
        c += abs(vectors[t1].dot(vectors[t2]));
        if (c>1.0) c-=1.0;
      }
    } else c = 1.0;
    fill(c);
    return v;
  }
  // if the flag above was set to true (index out of range), no tile corresponds to intersection
  return null;
}

void drawTile(Vector v, int t1, int t2) {
  beginShape();
  vertex(v.x, v.y);
  v.add(vectors[t1]); 
  vertex(v.x, v.y);
  v.add(vectors[t2]);
  vertex(v.x, v.y);
  v.sub(vectors[t1]);
  vertex(v.x, v.y);
  v.sub(vectors[t2]);
  vertex(v.x, v.y);
  endShape(CLOSE);
}

void mouseMoved() {
  vectorSelector.mouseMoved();
}


void mousePressed() {
  // mouseVec keeps track of scrolling (translation)
  if (!vectorSelector.selected())
    mouseVec.add(mouseX, mouseY);
}

void mouseReleased() {
  // remember where mouse is released so the next click/drag moves from this reference
  if (!vectorSelector.selected())
    mouseVec.sub(mouseX, mouseY);
}

void mouseDragged() {
  vectorSelector.mouseDragged();
  // if the vectors aren't being dragged, scroll the image with the mouse
  if (!vectorSelector.selected()) {
    SCROLL.set(mouseX - mouseVec.x, mouseY - mouseVec.y);
    SCROLL.scale(1/SCALE);
  }
}

void keyPressed() {
  // SPACE and ENTER play/pause animation
  if (key == ENTER || key == ' ')
    controlP5.controller("play").update();
}

// automatically generated method for the outlines toggle
void outlines(boolean flag) {
  outlines = flag;
}

// automatically generated method for the play button
// toggle play/pause and update the label
void play(int value) {
  if (playing)
    controlP5.controller("play").setLabel("play");
  else
    controlP5.controller("play").setLabel("pause");
  playing = !playing;
}

// handling of DropdownList elements need to be here,
// inside of the isGroup() check.
void controlEvent(ControlEvent e) {
  if (e.isGroup()) {
    if (e.group().getName().equals("symmetry")) {
      SYMMETRY = (int)e.getValue();
      e.group().setLabel("SYM: " + SYMMETRY);
      reset();  // reset to new symmetry
    } 
    else if (e.group().getName().equals("colors")) {
      colorMode = (int)e.group().getValue();
    }
  }
}


