
int headH, headY, bodyH, bodyY, footH, footY;

void setup() {
 size(400, 500);
 background(255);
 smooth();  
}

void draw() {
  background(255);
  
  int unit = mouseY/15;
  int x=mouseX;
  
  headY=5*unit;
  headH=8*unit;
  bodyH=15*unit;
  footH=4*unit;
  
  noStroke();
  fill(54,167,59);
 
  rectCenter(x, headY, headH, headH);
  
  bodyY=headY+(headH+bodyH)/2;
  rectCenter(x, bodyY, 6*unit, bodyH);
  
  footY=bodyY+(bodyH+footH)/2;
  rectCenter(x-int(2.5*unit), footY, footH, footH);
  rectCenter(x+int(2.5*unit), footY, footH, footH);
  
  fill(0);
  rectCenter(x-2*unit, headY-unit, 2*unit, 2*unit);
  rectCenter(x+2*unit, headY-unit, 2*unit, 2*unit);
  rectCenter(x, headY+unit, 2*unit, 2*unit);
  rectCenter(x, headY+2*unit, 4*unit, 2*unit);
  rect(x-2*unit, headY+2*unit, unit, 2*unit);
  rect(x+unit, headY+2*unit, unit, 2*unit);
}

void rectCenter(int x, int y, int w, int h) {
rect(x-(w/2), y-(h/2), w, h);
}
