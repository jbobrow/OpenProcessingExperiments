
class Bubble {

float x, y;
float diameter;

void start(float xpos, float ypos) {
  x = xpos;
  y = ypos;
  diameter = random(10,50);
}

void display() {
  strokeWeight(1);
  
  ellipse(x, y, diameter, diameter);
}
}

Bubble[] bubbles;
int numBubble = 255;
int currentBubble = 0;

void setup(){
size (500,450);
smooth();
bubbles = new Bubble[numBubble];
for (int i = 0; i < numBubble; i++) {
  bubbles[i] = new Bubble();
frameRate(100);
    
}
}

//moving through array to display bubles and randomize colour
void draw(){
for (int i = 0; i < numBubble; i++){
  bubbles[i].display();
  float value1 = random(i);
  float value2 = random(i);
  float value3 = random(i);
  float alpha = random(i);
  fill(value1, value2, value3, alpha);
  noCursor();
  
}
}

//keep drawing bubbles with mouse position
void mouseMoved() {
  bubbles[0].start(mouseX, mouseY);
  currentBubble++;
}






