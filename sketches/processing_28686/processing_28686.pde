
/**
* 
* Project 3 Template
* UCLA Design Media Arts, Spring 2011 
* Prof. Casey Reas
* 
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 2000;
boolean noMic = true;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();
}

void draw() {
  background(255);

  getVolume();
  
  if (noMic == true) {
    v = map(mouseX, 100, width, 0, 1000);  
  }
  
  testFace();
 
  //saveFrame("mask-####.png");
}


