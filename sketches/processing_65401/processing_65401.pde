
//Experiment with colors & lineWeights 

float strokeW = 1;
float lineX = 200;
float lineY = 200;

void setup() {
  size(400, 400);
}

void draw() {
  background(strokeW, strokeW/2, strokeW/4);
  stroke(strokeW/2,strokeW,strokeW/2.5);
  strokeWeight(strokeW);
  line(200,0,lineX,lineY);
  line(lineX,lineY,0,400);
  line(lineX,lineY,400,400);
  strokeW = strokeW+0.5;
  lineX= lineX -0.5;
  lineY = lineY +0.5;
}
