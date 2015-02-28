
float[] x = new float[2];
float[] y = new float[2];
float segLength = 50;

void setup() {
  size(320, 600);
  smooth(); 
  strokeWeight(5.0);
  stroke(0, 100);
}

void draw() {
  background(226);
  dragSegment(0, mouseX, mouseY);
 
  noFill();
  ellipse(145,120,60,90);
  noFill();
  ellipse(145,100,30,30);
  noFill();
  rect(140,165,10,15);
  noFill();
  ellipse(145,300,60,245);
  noFill();
  fill(0);
  text("HI MY NAME IS BOB", 95,500);
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx); 
  float eyeangle = atan2(100 - xin,1145 - yin); 
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(160, 400, angle);
  segment(130, 400, angle);
  if(x[i]>150){
    x[i] = 150;
  }
  if(x[i]< 140){
    x[i] = 140;
  }
  if(y[i]>105){
    y[i] = 105;
  }
  if(y[i]<95){
    y[i] = 95;
  }
  eye(x[i],y[i],eyeangle);
  
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();
}

void eye(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  ellipse(0, 0, 5, 5);
  popMatrix();
}

