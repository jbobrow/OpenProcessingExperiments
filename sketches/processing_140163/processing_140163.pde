
/**
 * ZGvG  
 * für dich, F! 
 
 */

float[] x = new float[20];
float[] y = new float[20];
float segLength = 18;
PFont letra;

void setup() {
  size(640, 360);
  strokeWeight(9);
  stroke(random(255), random(255), random(255), 100);
  frameRate(30);
}

void draw() {
  //saveFrame("frames2/####.tif");
  background(0);
  dragSegment(0, mouseX, mouseY);
  for (int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
  fill(random(240, 255), 0, 0);
  ellipse(width/2, height/2, 40, 40);
  if (mouseX < (width/2)+3 && mouseX > (width/2)-3) {
    if (mouseY < height/2+10 && mouseY > height/2-10) { 
      background(255);
      fill(random(255), random(255), random(255));
      letra = loadFont("showc.vlw");
      textFont(letra);
      text("FELIZ ANIVERSÁRIO!", width/2-250, height/2);
    }
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}



