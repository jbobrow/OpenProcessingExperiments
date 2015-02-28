
/** 
 * Dividing Rectangles
 * by Algirdas Rascius.
 * 
 * Mouse-click to restart.
 */ 
 
static final int SIZE = 50;
static final int CELL_SIZE = 10;
static final int ANIMATE_STEPS = 8;

LinkedList activeRectangles;
LinkedList doneRectangles;

void setup() {
  int side = CELL_SIZE*SIZE + 1;
  background(0);
  colorMode(HSB, TWO_PI, 1, 1, 1);
  size(side, side);
  initialize();
  frameRate(25);
}

void draw() {
  // Animate active restangles
  for (Iterator i=activeRectangles.iterator(); i.hasNext();) {
    Rectangle s = (Rectangle)i.next();
    s.drawRectangle();
    if (s.isAnimationDone()) {
      i.remove();
      if (s.canSplit()) {
        doneRectangles.add(s);
      }
    }    
  }
  // Randomly split rectangles
  float splitProbability = 1.0/(activeRectangles.size()+2);
  for (Iterator i=doneRectangles.iterator(); i.hasNext();) {
    Rectangle s = (Rectangle)i.next();
    if (random(1)<splitProbability) {
      i.remove();      
      s.splitRectangle();    
    }  
  }
  // Reset if finished
  if (activeRectangles.size()==0 && doneRectangles.size()==0) {
    initialize();
  }
}

void mousePressed() {
  initialize();
}

void keyPressed() {
  initialize();
}

void initialize() {
  activeRectangles = new LinkedList();
  doneRectangles = new LinkedList();
  activeRectangles.add(new Rectangle(0, 0, SIZE, SIZE, random(TWO_PI)));
}


class Rectangle {
  int x, y;
  int sizeX, sizeY;
  float hueValue;
  int animationStep;
  
  Rectangle(int x, int y, int sizeX, int sizeY, float hueValue) {
    this.x = x;
    this.y = y;
    this.sizeX = sizeX;
    this.sizeY = sizeY;
    this.hueValue = hueValue;
    this.animationStep = 0;
  }
  
  void drawRectangle() {
    animationStep++;
    int sideX = CELL_SIZE*sizeX - 1;
    int sideY = CELL_SIZE*sizeY - 1;
    int xx = x*CELL_SIZE+1;
    int yy = y*CELL_SIZE+1;
    fill(color(hueValue, 1, 1, pow((float)animationStep/ANIMATE_STEPS, 2)));
    noStroke();
    rect(xx, yy, sideX, sideY);
    stroke(color(0, 0, 0 , pow((float)animationStep/ANIMATE_STEPS, 2)));
    line(xx+sideX, yy, xx+sideX, yy+sideY);
    line(xx+sideX, yy+sideY, xx, yy+sideY);
  }
  
  boolean isAnimationDone() {
    return animationStep >= ANIMATE_STEPS;
  }

  boolean canSplit() {
    return sizeX > 1 || sizeY > 1;
  }
  
  void splitRectangle() {    
    if (random(2)<1 && sizeX > 1 || !(sizeY > 1)) {
      float hueDelta = PI*sizeX/SIZE/5;
      int splitX = 1 + (int)random(sizeX-1);    
      activeRectangles.add(new Rectangle(x, y, splitX, sizeY, (hueValue+hueDelta+TWO_PI)%TWO_PI));
      activeRectangles.add(new Rectangle(x+splitX, y, sizeX-splitX, sizeY, (hueValue-hueDelta+TWO_PI)%TWO_PI));
    } else {
      float hueDelta = PI*sizeY/SIZE/5;
      int splitY = 1 + (int)random(sizeY-1);    
      activeRectangles.add(new Rectangle(x, y, sizeX, splitY, (hueValue+hueDelta+TWO_PI)%TWO_PI));
      activeRectangles.add(new Rectangle(x, y+splitY, sizeX, sizeY-splitY, (hueValue-hueDelta+TWO_PI)%TWO_PI));
    }
  }    
}
  

