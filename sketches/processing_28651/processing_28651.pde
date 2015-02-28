
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
float volumeScalar = 20000;
boolean noMic = true;

void setup() {
  size(500, 500);
  smooth();
  setupVolume();
  setupTest();
}

void draw() {
  background(200,200,200);

  getVolume();
  

  
  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);  
  }
  

  
  testFace();
 
  //saveFrame("mask-####.png");
}


