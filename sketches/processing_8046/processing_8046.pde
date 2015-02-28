
void setup() {
 size(320, 240);
 ellipseMode(CENTER);
 noStroke();
 smooth();

}

ArrayList globus = new ArrayList();

color cursorColor = color(255, 255, 0);
Globus cursorGlobus = new Globus(-666, -666, cursorColor, MIN_GLOBUS_SIZE);
static final int MAX_GLOBUS_SIZE = 100;

static final int MIN_GLOBUS_SIZE = 20;
void mouseReleased() {
 color tempColor = color(255, 0, 0);
 globus.add(new Globus(mouseX, mouseY, tempColor, cursorGlobus.currentSize)); 
  
}


void draw() {
  if (mousePressed == true) {
    if (cursorGlobus.currentSize < MAX_GLOBUS_SIZE)
    cursorGlobus.currentSize++;
  } else if (cursorGlobus.currentSize > MIN_GLOBUS_SIZE) {
    cursorGlobus.currentSize--;
  }
  fill(99, 255);
  rect(0, 0, width, height);
  cursorGlobus.x = mouseX;
  cursorGlobus.y = mouseY;
  for(int i = 0; i < globus.size(); i++) {
    Globus tempGlobus = (Globus) globus.get(i);
    tempGlobus.paintBG();
  }

  for(int i = 0; i < globus.size(); i++) {
    Globus tempGlobus = (Globus) globus.get(i);
    tempGlobus.paint();
  }
  
  cursorGlobus.paint();

}

class Globus {
  
  int x;
  int y;
  color currentColor;
  
  int currentSize;
  
   Globus(int _x, int _y, color _currentColor, int _currentSize) {
     x = _x;
     y = _y;
     currentColor = _currentColor;
     currentSize = _currentSize;
   }
   
   void paintBG() {
     fill(255, 255);
     ellipse(x, y, currentSize + 10, currentSize + 10);
   }
   
   void paint() {
     fill(currentColor, 255);
     ellipse(x, y, currentSize, currentSize); 
   }
}

