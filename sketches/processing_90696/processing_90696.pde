
class Button {
  int x, y; 
  int diameter; 
  color baseGray; 
  color overGray; 
  color pressGray; 
  boolean over = false; 
  boolean pressed = false; 
  Button(int xp, int yp, int d, color b, color o, color p) {
  x = xp;
  y = yp;
  diameter = d;
  baseGray = b;
  overGray = o;
  pressGray = p;
}

void update() {
  if ((mouseX >= x) && (mouseX <= x+diameter) &&
    (mouseY >= y) && (mouseY <= y+diameter)) {
    over = true;
  } else {
    over = false;
  }
}

boolean press() {
    if (over == true) {
      pressed = true;
      return true;
  } else {
    return false;
  }
}

void release() {
  pressed = false; // Set to false when the mouse is released
}

void display() {
  if (pressed == true) {
    fill(pressGray);
  } else if (over == true) {
    fill(overGray);
  } else {
    fill(baseGray);
  }
  noStroke();
  ellipse(x, y, diameter, diameter);
  }
}

////////////////////////////////////////////////////////////////////////

class DrawButton extends Button {
  int xoff, yoff;
  DrawButton(int x, int y, int s, color bv, color ov, color pv) {
  super(x, y, s, bv, ov, pv);
}

void press(int mx, int my) {
  super.press();
  xoff = mx - x;
  yoff = my - y;
}

void drawb(int mx, int my) {
  if (over == true) {
    x = mx - xoff;
    y = my - yoff;
    
  }
}
}

DrawButton icon;
void setup() {
  size(400, 400);
  smooth();
  color gray = color(255, 0, 100, 50);
  color white = color(0, 200, 170, 50);
  color black = color(255);
  stroke(255);
  icon = new DrawButton(50, 50, 50, gray, white, black);
}

void draw() {
//background(204);
  icon.update();
  icon.display();
}

void mousePressed() { 
  icon.press(mouseX, mouseY); 
}

void mouseReleased() { 
  icon.release(); 
}

void mouseMoved() { 
  icon.drawb(mouseX, mouseY); 
}



