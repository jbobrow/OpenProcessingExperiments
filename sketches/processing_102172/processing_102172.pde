
int counter;
int dotCount = 0; 
int dotCurrent = 0;
Dot[] dots = new Dot[100]; //maximum of dots alloted

void setup() {  //setup function called initially, only once
  size(850, 850);
  background(255);  //set background white
  colorMode(HSB);   //set colors to Hue, Saturation, Brightness mode
  counter = 0;

  //fill dots array while displaying on screen
  for (int i=0; i < dotCoords.length; i++) {
    int[] coords = int (split(dotCoords[i], ", "));
    dots[i] = new Dot(coords[0], coords[1], i);
    dotCount = i;
  }
}

void draw() {  //draw function loops 
  counter++;
  noStroke();
  fill(random(255),100,255,50);
  
  if(mousePressed == true) { //add some interaction
    ellipse(mouseX, mouseY, 20, 20);
  }
  else {
    ellipse(width/2, height/2, 80*sin(counter), 80*sin(counter));
  }
  
  
}

class Dot {
  /*
    Dot: is constructed with (x,y) coordinates and an order
    number, and creates a spot in the display area.
    
    A dot can tell you it's cordinates, as well as, it's
    order number, and whether it's activated or not (currently
    not used.)
  */
  
  int x, y, c;
  boolean activated;
  
  Dot(int pointX, int pointY, int count) {
    x = pointX;
    y = pointY;
    c = count;
    activated = false;
    strokeWeight(6);
    point(x, y);
    fill(0, 0, 0);
    text(c+1, x+6, y+6);
  }
  
  boolean clickDot() {
    return !activated;
    
  }
  int X() {return x;}
  int Y() {return y;}
  int count() {return c;}
  boolean activated() {return activated;}
}



