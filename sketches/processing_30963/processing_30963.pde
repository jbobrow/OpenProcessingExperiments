
PFont font;
Ring[] rings; 
int numRings = 100;
int currentRing = 0;
float xAdd = 0;
float yAdd = 0;
float xTotal = 0;
float yTotal = 0;

void setup() {
  font = loadFont("Courier.vlw");
  size(205, 260);
  smooth();
  rings = new Ring[numRings]; 
  for (int i = 0; i < numRings; i++) {
    rings[i] = new Ring(); 
  }
}

void draw() {
  xTotal += xAdd;
  yTotal += yAdd;
  background(0);
  for (int i = 0; i < numRings; i++) {
    rings[i].grow();
    rings[i].display();
  }
  rings[currentRing].start(sin(xTotal)*50+width/2, sin(yTotal)*50+120);
  currentRing++;
  if (currentRing >= numRings) {
    currentRing = 0;
  }
  fill(0);
  noStroke();
  rect(0,0,width,20);
  rect(0,220,width,40);
  fill(255);
  textFont(font,10);
  text("Use arrow keys to change waves.",5,13);
  text("X Amplitude: " + xAdd, 5, 231);
  text("Y Amplitude: " + yAdd, 5, 243);
  text("Press R to reset.",5,255);
}

void keyPressed(){
  if (key == 'r'){
    xAdd = 0;
    yAdd = 0;
    xTotal = 0;
    yTotal = 0;
  }
  if (key == CODED){
    if (keyCode == UP){
      yAdd += .05;
    }
    if (keyCode == DOWN){
      yAdd -= .05;
    }
    if (keyCode == RIGHT){
      xAdd += .05;
    }
    if (keyCode == LEFT){
      xAdd -= .05;
    }
  }
}

class Ring {
  float x, y;
  float diameter;
  boolean on = false;
  
  void start(float xpos, float ypos) {
    x = xpos;
    y = ypos;
    on = true;
    diameter = 1;
  }
  
  void grow() {
    if (on == true) {
      diameter += 4;
      if (diameter > 500) {
        on = false;
      }
    }
  }
  
  void display() {
    if (on == true) {
      noFill();
      strokeWeight(2);
      stroke(155,100);
      ellipse(x, y, diameter, diameter);
    }
  }
}

