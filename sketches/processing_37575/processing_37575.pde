
int lineLength=15;
float[] x = new float[50];
float[] y = new float[50];

void setup(){

size(700,400);
background(255);
smooth();
stroke(0);

for(int i=0; i<4000; i++){
   float xPos = random(0,700);
   float yPos = random (0,400);
line(xPos, yPos,xPos+lineLength,yPos+lineLength);
rotate(radians(5));
}
}
void draw(){
 
  dragSegment(20, mouseX, mouseY);
  dragSegment(1, x[0], y[0]);
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * lineLength;
  y[i] = yin - sin(angle) * lineLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, lineLength, 10);
  popMatrix();
}

 


