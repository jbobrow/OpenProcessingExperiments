
Stick[] sticks;
int numSticks = 90;
int currentStick= 0;

void setup() {
  size(500,500);
  smooth();
  sticks = new Stick[numSticks];
  for(int i = 0; i < numSticks; i++) {
    sticks[i] = new Stick();
  }
}
void draw() {
  background(0);
  for(int i = 0; i <numSticks; i++) {
    sticks[i].grow();
    sticks[i].display();
  }
}
void mousePressed() {
  sticks[currentStick].start(mouseX, mouseY);
  currentStick++;
  if (currentStick >= numSticks) {
  currentStick = 0;
  }
}

class Stick {
  float x, y; float diameter;
  boolean on = false;
  
  void start(float xpos, float ypos) {
    x=xpos;
    y=ypos;
    on=true;
    diameter=HALF_PI;
  }
  void grow() {
    if (on ==true) {
      diameter += 0.5;
      if (diameter > 400) {
        on = false;
      }
    }
  }
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(4);
      stroke(diameter, diameter, x ,153);
      triangle(x,y,x, y, diameter, diameter);
      triangle(diameter, diameter, x, y, x, y);
      
    }
  }
}



