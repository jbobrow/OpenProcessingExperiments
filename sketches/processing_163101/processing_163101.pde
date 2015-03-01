
void setup() {
  size(1000,1000);
  background(255);
  smooth();
  frameRate(5);
}


void draw(){
  stroke(100,35);
  
  int n = 500;
  float[] xTop = new float[n];
  float[] xBottom = new float[n];
  float[] yTop = new float[n];
  float[] yBottom = new float[n];
  
  for(int i = 0; i < n; i++) {
    xTop[i] = random(0, 1000);
    xBottom[i] = random(0,1000);
    yTop[i] = random(0, 1000);
    yBottom[i] = random(0, 1000);
    line(xTop[i], yTop[i], xBottom[i], yBottom[i]);
  }
}

