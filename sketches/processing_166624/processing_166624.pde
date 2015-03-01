
PFont poopfont;

// precision

Draggable d;

void setup() {
  background(255);
  size(670,844);
  smooth();
  d = new Draggable(50,50,100,100);
}


void draw() {
     
  background(255);
  d.rollover(mouseX,mouseY);
  d.drag(mouseX,mouseY);
  d.display();
   
}

void mousePressed() {
  d.clicked(mouseX,mouseY);
}

void mouseReleased() {
  d.stopDragging();
}

// percision principal 

// class for dragging

class Draggable {
  boolean dragging = false; // Is the object being dragged
  boolean rollover = false; // Is the mouse over object

  float x, y, w, h;          // palcement and size
  float offsetX, offsetY; // Mouseclick offset

  Draggable(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
  }

  // display


  void display() {

    smooth();
    fill(108, 127, 129);
    textAlign(LEFT);
    poopfont = loadFont("Franklin.vlw");
    textFont(poopfont, 22);
    text("Without excessive overlap, align these squares side by side.", 25, height/2);  
    text("Drag if necessary.", 25, height/2+25);  

    // dragable square 

    noStroke();
    if (dragging) fill (114, 135, 137);
    else if (rollover) fill(108, 127, 129);
    else fill(175, 200);
    rect(x, y, w, h);

    // inverted mouse

    noStroke();
    if (dragging) fill (188, 209, 211);
    else if (rollover) fill(108, 127, 129);
    else fill(175, 200);
    rect(mouseY, mouseX, w, h);
  }

  // if point is inside the rectangle 

  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;

      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }

  // rollover // if a point inside the rectangle 

  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = false;
    } else {
      rollover = true;
    }
  }

  // Stop dragging

  void stopDragging() {
    dragging = false;
  }

  // Drag the rectangle

    void drag(int mx, int my) {
    if (dragging) {
      x = mx + offsetX;
      y = my + offsetY;
    }
  }
}



