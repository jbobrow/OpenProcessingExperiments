
ArrayList<GameObject> objects = new ArrayList<GameObject>();

void setup() {  //setup function called initially, only once
  size(800, 800);
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  
  objects.add(new Box());
}

void draw()
{
 background(0);  //set background white
 ellipse(mouseX, mouseY, 10, 10);
 
 for(GameObject obj: objects)
 {
     obj.run();
     obj.show();
 }
}

class Box extends Draggable
{
    public Box()
    {
    }
    
    public String func(String input)
    {
        return input;
    }
}

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
  void show() {
    stroke(0);
    if (dragging) fill (50);
    else if (rollover) fill(100);
    else fill(175,200);
    rect(x,y,w,h);
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
