
// Click and Drag an object
// Daniel Shiffman 

// A class for a draggable thing

class Draggable {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  
  float x,y,w,h,c;          // Location and size
  float offsetX, offsetY; // Mouseclick offset

  Draggable(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
    //constrain(x, -1, width);
    //constrain(y, -1, height);
  }

  // Method to display
  void displayrect() {
    stroke(200, 145, 2);
    fill(0,0,0,210);
    if (dragging) 
    fill (255);
    else if (rollover) 
    fill(255, 2, 2);
    
    rect(x,y,w,h);
  }
  
    void displayell() {
    stroke(200, 145, 2);
    fill(0,0,0,210);
    if (dragging) 
    fill (255);
    else if (rollover) 
    fill(255, 2, 2);
    ellipse(x,y,w,h);
  }
  
    void displaytri() {
    stroke(200, 145, 2);
    fill(0,0,0,210);
    triangle(x,y, w, h, x, w+y);
    if (dragging) 
    fill (255);
    else if (rollover) 
    fill(255, 2, 2);
    
  }
   
   
  //void mshape() {
    //rect(x, y, w, h);
    
    

  // Is a point inside the rectangle (for click)?
  void clicked(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      dragging = true;
      // If so, keep track of relative location of click to corner of rectangle
      offsetX = x-mx;
      offsetY = y-my;
    }
  }
  
  // Is a point inside the rectangle (for rollover)
  void rollover(int mx, int my) {
    if (mx > x && mx < x + w && my > y && my < y + h) {
      rollover = true;
    } else {
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



