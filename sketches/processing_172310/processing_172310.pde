
Scrollbar bar1, bar2;


void setup (){
  size (300, 300);
  noStroke ();
  bar1 = new Scrollbar (60, 100, 150, 40, 0.0, 100.0);
  bar2 = new Scrollbar (100, 200, 150, 40, 0.0, 100.0);
}

void draw (){
  background (40, 56, 89);
  fill (0);
  int pos1 = int(bar1.getPos());
  float pos2 = bar2.getPos ();
  bar1.update (mouseX, mouseY);
  bar2.update (mouseX, mouseY);
  bar1.display ();
  bar2.display();
}

void mousePressed (){
  bar1.press (mouseX, mouseY);
  bar2.press (mouseX, mouseY);
}

void mouseReleased (){
  bar1.release ();
  bar2.release ();
}

void keyPressed (){
  bar1.key ();
  bar2.key ();
}

class Scrollbar {
int x, y; // The x- and y-coordinates
float sw, sh; // Width and height of scrollbar
float pos; // Position of thumb
float posMin, posMax; // Max and min values of thumb
boolean rollover; // True when the mouse is over
boolean locked; // True when its the active scrollbar
float minVal, maxVal; // Min and max values for the thumb
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
// Locks the thumb so the mouse can move off and still update
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
void key (int mx, int my){
  if (key == CODED) {
    if (keyCode == LEFT){
      pos = constrain (mx-sh/2, posMin, posMax);
    } else if (keyCode == RIGHT){
      pos = constrain (mx+sh/2, posMin, posMax);
      
    }
  }
}


void display() {
fill(255);
rect(x, y, sw, sh);
if ((rollover==true) || (locked==true)) {
fill(0);
} else {
fill(102);
}
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





