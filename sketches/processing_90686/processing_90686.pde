
class Check {
  int x, y; // The x- and y-coordinates
  int size; // Dimension (width and height)
  color baseGray; // Default gray value
  boolean checked = false; // True when the check box is selected

Check(int xp, int yp, int s, color b) {
  x = xp;
  y = yp;
  size = s;
  baseGray = b;
}

// Updates the boolean variable checked
void press(float mx, float my) {
  if ((mx >= x) && (mx <= x+size) && (my >= y) && (my <= y+size)) {
  checked = !checked; // Toggle the check box on and off
  }
}

// Draws the box and an X inside if the checked variable is true
void display() {
  stroke(255);
  fill(baseGray);
  rect(x, y, size, size);
  if (checked == true) {
    line(x, y, x+size, y+size);
    line(x+size, y, x, y+size);
  }
}
}

///////////////////////////////////////////////////////////

class Radio {
  int x, y; // The x- and y-coordinates of the rect
  int size, dotSize; // Dimension of circle, inner circle
  color baseGray, dotGray; // Circle gray value, inner gray value
  boolean checked = false; // True when the button is selected
  int me; // ID number for this Radio object
  Radio[] others; // Array of all other Radio objects

Radio(int xp, int yp, int s, color b, color d, int m, Radio[] o) {
  x = xp;
  y = yp;
  size = s;
  dotSize = size - size/3;;
  baseGray = b;
  dotGray = d;
  others = o;
  me = m;
}

// Updates the boolean value press, returns true or false
boolean press(float mx, float my) {
  if (dist(x, y, mx, my) < size/2) {
    checked = true;
    for (int i = 0; i < others.length; i++) {
      if (i != me) {
        others[i].checked = false;
      }
    }
    return true;
    } else {
    return false;
  }
}

// Draws the element to the display window
void display() {
  noStroke();
  fill(baseGray);
  ellipse(x, y, size, size);
  if (checked == true) {
    fill(dotGray);
    ellipse(x, y, dotSize, dotSize);
  }
}
}

///////////////////////////////////////////////////////////

int numChecks = 10;
Check[] checks = new Check[numChecks];
int numButtons = 5;
Radio[] buttons = new Radio[numButtons];

void setup() {
  size(100, 90);
  smooth();
  int x = 14;
  int y = 24;
  
  for (int i = 0; i < numChecks; i++) {
    checks[i] = new Check(x, y, 12, color(0));
    x += 15;
    if (x > 80) {
      x = 14;
      y += 30;  
    }
  }
  
  for (int i = 0; i < buttons.length; i++) {
    int x2 = i*15 + 20;
    buttons[i] = new Radio(x2, 45, 12, color(255), color(0), i, buttons);
  }
}

void draw() {
  background(120);
  for (int i=0; i<numChecks; i++) {
    checks[i].display();
  }
   
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].display();
  }
}

void mousePressed() {
  for (int i = 0; i < numChecks; i++) {
    checks[i].press(mouseX, mouseY);
  }
  
  for (int i = 0; i < buttons.length; i++) {
    buttons[i].press(mouseX, mouseY);
  }
}




 




