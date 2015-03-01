
Scrollbar bar;
PImage img;

void setup() {
size(500, 500);
noStroke();
// Inputs: x, y, width, height, minVal, maxVal 
bar = new Scrollbar(10, 45, 80, 10, -200.0, 0.0); 
img = loadImage("eye.jpg");
}
void draw() { background(204);
int x = int(bar.getPos()); image(img, x, 0);
bar.update(mouseX, mouseY);
              bar.display();
            }
            void mousePressed() {
              bar.press(mouseX, mouseY);
}
            void mouseReleased() {
              bar.release();
}
class Scrollbar {
int x, y;
float sw, sh;
float pos;
float posMin, posMax; 
boolean rollover; 
boolean locked;
float minVal, maxVal;


Scrollbar (int xp, int yp, int w, int h, float miv, float mav) {
x = xp;
y = yp; 
sw = w;
 sh = h;
  minVal = miv;
  maxVal = mav;
  pos = x + sw/2 - sh/2;
  posMin = x;
  posMax = x + sw - sh;
}
// Updates the over boolean and the position of the thumb
void update(int mx, int my) {
  if (over(mx, my) == true) {
    rollover = true;
  } else {
    rollover = false;
  }
  if (locked == true) {
    pos = constrain(mx-sh/2, posMin, posMax);
 } 
}

void press(int mx, int my) {
  if (rollover == true) {
    locked = true;
  } else {
    locked = false;
  }
}
// Resets the scrollbar to neutral
void release() {
  locked = false;
}
// Returns true if the cursor is over the scrollbar
boolean over(int mx, int my) {
  if ((mx > x) && (mx < x+sw) && (my > y) && (my < y+sh)) {
    return true;
  } else {
    return false;
  }
}

void display() {
    fill(255);
    rect(x, y, sw, sh);
    if ((rollover==true) || (locked==true)) {
      fill(0);
    } else {
fill(102); }
    rect(pos, y, sh, sh);
  }
  // Returns the current value of the thumb
  float getPos() {
    float scalar = sw/(sw-sh);
    float ratio = (pos - x) * scalar;
    float offset = minVal + (ratio/sw * (maxVal-minVal));
    return offset;
} 
}



