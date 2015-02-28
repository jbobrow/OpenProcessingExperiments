
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
float easing = 0.9;  // Between 0 and 1
float volumeScalar = 500;
boolean noMic = true;




void setup() {
  size(500, 500);
  smooth();
   frameRate(30);
  setupVolume();
}

void draw() {
  background(255);
   pushMatrix();

 
  getVolume();
  
  if (noMic == true) {
    v = map(mouseX, 0, width, 0, 1000);  
  }
  
  testFace();
  
 
  popMatrix();
}




