
float theta;
float inc;

void setup() {
  size (1200, 800);
  smooth();
  theta = 0;
  inc = 0.0;
}

void mouseDragged() {
  color c0= color (70, 60, 0);
  color c1= color(0, 200, 100);
  int numSteps = 700;
  for (int i=0; i<numSteps; i++) {
    float a = i/(numSteps-5.0);
    colorMode (RGB);
    fill(lerpColor(c0, c1, a));
  }
}

void draw(){
  background (0, 0, 255);
  if (mousePressed == true){
    background (200, 0, 200);
  }
  pushMatrix();
  translate(mouseX, mouseY);
  rotate(radians(theta));
  fill(0, 0, 0);
  drawShape();
  theta++;
  popMatrix();
  
  pushMatrix();
  translate(width/2, height/2);
  rotate(radians(theta));
  translate(0, 140);
  fill(255, 0, 0);
  drawShape2();
  theta++;
  popMatrix();
}

void drawShape() {
  int numSpokes = 100;
  for (int i=0; i<numSpokes; i++){
    float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
    float t1= t0 + (TWO_PI/(2*numSpokes));
    arc(0, 0, 2500, 2500, t0, t1);
  }
  strokeWeight(4);
  color (0, 130, 185);
  strokeCap(SQUARE);
}

void drawShape2(){
  int numSpokes = 100;
  for (int i=0; i<numSpokes; i++){
    float t0 = map(i, 0, numSpokes-1, 0, TWO_PI);
    float t1= t0 + (TWO_PI/(2*numSpokes));
    arc(0, 0, 2000, 2000, t0, t1);
  }
  strokeWeight(4);
  color (0, 130, 185);
  strokeCap(SQUARE);
}


