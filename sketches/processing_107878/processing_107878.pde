
/* @pjs preload="help.jpg" */

Shape[] shapeArray;
int transparency;

final int SHAPES = 500;
final int MIN_SIZE = 10;
final int MAX_SIZE = 25;
final int DRAW_SIZE = 500;
final int DRAW_SIZE_WITH_BG_HEIGHT = DRAW_SIZE + 200;

void setup() {
  //Sets size, BG, etc.
  //For some reason, processing.js would not accept constants for the sizes here.
  size(500, 700);
  background(255);
  transparency = 50;
  background(loadImage("help.jpg"));
  
  //Creates and fills an array with shapes.
  shapeArray = new Shape[SHAPES];
  for (int i = 0; i < SHAPES; i++) {
    int shapeId = (int) random(0, 3);
    color c = color(random(255), random(255), random(255));
    int size = (int) random(MIN_SIZE, MAX_SIZE);
    int locX = (int) random(DRAW_SIZE-size);
    int locY = (int) random(DRAW_SIZE-size);
    shapeArray[i] = new Shape(c, size, locX, locY, shapeId, DRAW_SIZE);
  }
  
  noStroke();
}

void draw() {
  fill(255, transparency);
  rect(0,0,DRAW_SIZE,DRAW_SIZE);
  for (int i = 0; i < SHAPES; i++) {
    shapeArray[i].display();
    shapeArray[i].move();
  }
}

void mouseMoved() {
  if (mouseY >= DRAW_SIZE)
    transparency = 50 - (int) (50*1.5*mouseX/DRAW_SIZE);
}
class Shape {
  color c;
  int size;
  int size2;
  int x;
  int y;
  int id;
  int bounds;
  
  public static final int TRIANGLE = 0;
  public static final int CIRCLE = 1;
  public static final int SQUARE = 2;
  
  public Shape(color c, int size, int x, int y, int id, int boundary) {
    this.c = c;
    this.size = (int) size;
    this.x = x;
    this.y = y;
    this.id = id;
    this.bounds = boundary;
  }
  
  void display() {
    smooth();
    fill(c);
    if (id == TRIANGLE)
      triangle(x+size/2, y, x, y+size, x+size, y+size);
    else if (id == CIRCLE) {
      ellipseMode(CORNER);
      ellipse(x, y, size, size);
    }
    else if (id == SQUARE)
      rect(x, y, size, size);
  }
  
  void move() {
    int xminus = -1;
    int xplus = 1;
    int yminus = -1;
    int yplus = 1;
    
    //Check window boundaries
    if (x > 0)
      xminus = -2;
    if (x+size < bounds)
      xplus = 2;
    if (y > 0)
      yminus = -2;
    if (y+size < bounds)
      yplus = 2;
    
    x += (int) random(xminus, xplus);
    y += (int) random(yminus, yplus);
  }
}


