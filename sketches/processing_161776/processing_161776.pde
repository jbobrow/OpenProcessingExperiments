

// Click and Drag an object
// Daniel Shiffman 

Draggable d, d1, d2, d3, d4, d5, d6, d7, d8, d9, d10;

void setup() {
  size(700,700);
  smooth();
  
  d = new Draggable(random(100),random(300),random(250, 500),random(100));
  d1 = new Draggable(random(80),random(120),random(100),random(50,110));
  d2 = new Draggable(random(102),random(150),random(200),random(2, 100));
  d3 = new Draggable(random(100),random(130),random(220),random(130));
  d4 = new Draggable(random(100),random(200),random(350),random(200));
  d5 = new Draggable(random(109),random(104),random(100),random(120));
  d6 = new Draggable(random(109),random(204),random(100),random(120));
  d7 = new Draggable(random(-200,200),random(104),random(200),random(301));
  d8 = new Draggable(random(109),random(104),random(100),random(120));
  d9 = new Draggable(random(109),random(204),random(100),random(120));
  d10 = new Draggable(random(198),random(189),random(100),random(223));
  

}

void draw() {
  background(255);
  d.rollover(mouseX,mouseY);
  d.drag(mouseX,mouseY);
  d.displayrect();
  
  d1.rollover(mouseX,mouseY);
  d1.drag(mouseX,mouseY);
  d1.displayrect();
  
  d2.rollover(mouseX,mouseY);
  d2.drag(mouseX,mouseY);
  d2.displayrect();
  
  d3.rollover(mouseX,mouseY);
  d3.drag(mouseX,mouseY);
  d3.displayrect();
  
  d4.rollover(mouseX,mouseY);
  d4.drag(mouseX,mouseY);
  d4.displayrect();
  
  d5.rollover(mouseX,mouseY);
  d5.drag(mouseX,mouseY);
  d5.displayrect();
  
  d6.rollover(mouseX,mouseY);
  d6.drag(mouseX,mouseY);
  d6.displayrect();
  
  d7.rollover(mouseX,mouseY);
  d7.drag(mouseX,mouseY);
  d7.displayrect();
  
   
  d8.rollover(mouseX,mouseY);
  d8.drag(mouseX,mouseY);
  d8.displayrect();
  
   
  d9.rollover(mouseX,mouseY);
  d9.drag(mouseX,mouseY);
  d9.displayrect();
  
   
  d10.rollover(mouseX,mouseY);
  d10.drag(mouseX,mouseY);
  d10.displayrect();
 
  
  if (frameCount <= 2) {
      saveFrame("generated###.png");
  }
    
  
  
  
  
}

void mousePressed() {
  d.clicked(mouseX,mouseY);
  
  d1.clicked(mouseX,mouseY);
  
  d2.clicked(mouseX,mouseY);
  
  d3.clicked(mouseX,mouseY);
  
  d4.clicked(mouseX,mouseY);
  
  d5.clicked(mouseX,mouseY);
  
  d6.clicked(mouseX,mouseY);
  
  d7.clicked(mouseX,mouseY);
  
  d8.clicked(mouseX,mouseY);
  
  d9.clicked(mouseX,mouseY);
  
  d10.clicked(mouseX,mouseY);
  
  
}

void mouseReleased() {
  d.stopDragging();
  d1.stopDragging();
  d2.stopDragging();
  d3.stopDragging();
  d4.stopDragging();
  d5.stopDragging();
  d6.stopDragging(); 
  d7.stopDragging();
  d8.stopDragging();
  d9.stopDragging(); 
  d10.stopDragging();
    
  
}

void keyPressed()  {
    if (key == ENTER) {
    saveFrame("Enter##.png");
  }
}


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
    fill(0,0,0,150);
    if (dragging) 
    fill (255);
    else if (rollover) 
    fill(255, 2, 2);
    rect(x,y,w,h);
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




