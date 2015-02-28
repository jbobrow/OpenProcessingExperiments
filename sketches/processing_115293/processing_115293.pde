
/* Kathleen Lew
*/
Draggable e1, e2, e3;
void setup() {
 loop();
  size(500,500);
  smooth();
  e1 = new Draggable(width/3, height/2, width/4.166666, height/4.1666666);
  e2 = new Draggable(width/4, height/1.4, width/5, height/5);
  e3 = new Draggable(width/2, height/3, width/6.25, height/6.25);
 
}
void draw() {
 background(11, 192, 214);
  e1.rollover(mouseX, mouseY);
  e1.drag(mouseX, mouseY);
  
  e2.rollover(mouseX, mouseY);
  e2.drag(mouseX, mouseY);
  
  e3.rollover(mouseX, mouseY);
  e3.drag(mouseX, mouseY);
  
  e1.display();
  e2.display();
  e3.display();
   
  
  // Snowman Nose
  fill(245, 138, 7);
  //        x1, y1,  x2,  y2,  x3,  y3
  triangle(width/2.0408, height/2.27272727, width/1.9607, height/2.27272727, width/2, height/2.22222);
  
  // Hat
  // orange part
  rect(width/2.5, height/2.941176, width/5, height/100, 5, 5, 0, 0);
  // black part
  fill(10, 10, 10);
  // rect(a, b, c, d, tl, tr, br, bl)
  // top
  rect(width/2.5, height/2.85714, width/5, height/50, 5, 5, 5, 5);
  // bottom
  rect(width/2.5, height/3.125, width/5, height/50, 5, 5, 5, 5);
  
  // tall part of hat
  rect(width/2.222222, height/5, width/10, height/8.3333, 5, 5, 5, 5);
  
  // Right Arm
  // line(x1, y1, z1, x2, y2, z2)
  line(width/1.66666, height/1.6129, width/1.3157, height/2);
  // Left Arm
  line(width/2.5, height/1.6129, width/3.8461, height/2);
  
  // Buttons
  ellipse(width/2, height/1.72413, 5, 5);
  ellipse(width/2, height/1.61290, 5, 5);
  ellipse(width/2, height/1.51515, 5, 5);
  
  // Eyes
  // Left
  ellipse(width/2.08333, height/2.3809, 5, 5);
  ellipse(width/1.92307, height/2.3809, 5, 5);
  
}

void mousePressed() {
  e1.clicked(mouseX, mouseY);
  e2.clicked(mouseX, mouseY);
  e3.clicked(mouseX, mouseY);
}
void mouseReleased() {
  e1.stopDragging();
  e2.stopDragging();
  e3.stopDragging();
}
/* This class was used as a reference,
The actual snowman uses this Draggable class */
class Draggable {
  boolean dragging = false; // Is the object being dragged?
  boolean rollover = false; // Is the mouse over the ellipse?
  
  float x,y,w,h;          // Location and size
  float offsetX, offsetY; // Mouseclick offset

  Draggable(float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    offsetX = 0;
    offsetY = 0;
  }

  // Method to display
  void display() {
    stroke(0);
    fill(255);
    ellipse(x,y,w,h);
  }

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



