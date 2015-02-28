
void setup() {
  size(640, 360);
  background(51);
  noStroke();
  noLoop();
}

void draw() {
 
  //drawTarget(width*0.5, height*0.5, 300, 10);
drawTarget(nX, nY, 300, 10);
}

void drawTarget(float xloc, float yloc, int size, int num) {
  float grayvalues = 255/num;
  float steps = size/num;
  for (int i = 0; i < num; i++) {
    fill(i*grayvalues);
    ellipse(xloc, yloc, size - i*steps, size - i*steps);
  }
}

void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}
