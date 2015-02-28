


float v; 
float easing = 0.4;  // Between 0 and 1
float volumeScalar = 8300;
boolean noMic = true;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();
  startFace();
}

void draw() {
  background(255);

  getVolume();
  
  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);  
  }
  
  testFace();
 
  //saveFrame("mask-####.png");
}


