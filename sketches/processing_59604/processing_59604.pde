
/**
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 500;
boolean mic = true;

void setup() {
  size(500, 500);
  background(#FFFFFF);
  ellipseMode(CENTER); 
  smooth();
  setupVolume();
}

void draw() {
  background(255);

  getVolume();
  
  if (mic == false) {
    v = mouseX; 
  }
  
  testFace();
 
  //saveFrame("mask-####.png");
}


