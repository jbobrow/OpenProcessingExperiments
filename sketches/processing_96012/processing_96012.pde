
// Click and Drag an object
// Daniel Shiffman <http://www.shiffman.net>

// A class for a draggable thing

class DragCircle {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  boolean SS=false; //scale 
  int r=int(random(0, 255));
  int g=int(random(0, 255));
  int b=int(random(0, 255));
  boolean clk=false;
  boolean calling=false;
  float x, y, w, h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset
  color current, t2;
  DragCircle(float tempX, float tempY, float tempW, float tempH, color active) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    current=active;
    offsetX = 0;
    offsetY = 0;
  }

  // Method to display
  void display(color active) {
    //current=active;
    //t2=active;
    noStroke();
    if (clk) {
      if (dragging) fill (50);
      else if (rollover) fill(100);
      else fill(current);
    }
    else {
      fill(current);
      clk=false;
    }
    ellipse(x, y, w, h);
  }

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my, color active) {
    if (mx > x-w/2 && mx < x + w/2 && my > y-h/2 && my < y + h/2) {
      dragging = true;
      //t2=active;
      clk=true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
      choice=0;
    }
  }
  void Gscale() {
  }
  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x-w/2 && mx < x + w/2 && my > y-h/2 && my < y + h/2) {
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


