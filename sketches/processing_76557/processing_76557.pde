
Draggable cp1, cp2, p1, p2;
float pSize = 20;
ArrayList<Draggable> draggables;

void setup() {

  size(400, 400);

  draggables = new ArrayList<Draggable>();

  p1 = new Draggable(120, 100, pSize, pSize, "p1");
  draggables.add(p1);
  p2 = new Draggable(250, 100, pSize, pSize, "p2");
  draggables.add(p2);

  cp1 = new Draggable(50, 300, pSize, pSize, "cp1");
  draggables.add(cp1);
  cp2 = new Draggable(350, 300, pSize, pSize, "cp2");
  draggables.add(cp2);
  
  rectMode(CENTER);

}

void draw() {

  background(255);

  for (Draggable draggable : draggables) {
    draggable.rollOver(mouseX, mouseY);
    draggable.drag(mouseX, mouseY);
    draggable.display();
  }
  
  stroke(0);
  noFill();
  curve(cp1.x, cp1.y, p1.x, p1.y, p2.x, p2.y, cp2.x, cp2.y);
  text("curve(cp1.x, cp1.y, p1.x, p1.y, p2.x, p2.y, cp2.x, cp2.y)", 40, 380);
  
}

void mousePressed() {
  for (Draggable draggable : draggables) {
    draggable.clicked(mouseX,mouseY);
  }
}

void mouseReleased() {
  for (Draggable draggable : draggables) {
    draggable.stopDragging();
  }
}

// Click and Drag an object
// Daniel Shiffman 

// A class for a draggable thing

class Draggable {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?

  float x, y, w, h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset

  String label;

  Draggable(float tempX, float tempY, float tempW, float tempH, String tempLabel) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
    label = tempLabel;
  }

  // Method to display
  void display() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175, 200);
    rect(x, y, w, h);
    fill(0);
    text(label, x, y + pSize + 15);
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x - w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }

  // Is a point inside the rectangle (for rollover)
  void rollOver(int mx, int my) {
    if (mx > x - w/2 && mx < x + w/2 && my > y - h/2 && my < y + h/2) {
      rollover = true;
    } 
    else {
      rollover = false;
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



