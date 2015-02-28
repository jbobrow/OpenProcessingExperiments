
/**
* Project 1 Template
* UCLA Design Media Arts, Summer 2012 
* Instructor Eric Parren
* Code by Casey Reas 
*
* Note: Put all of your code in the "testFace" tab. Leave
* this tab and the "volume" tab as they are. You can set
* your variables at the top of "testFace".
* 
* Based on code from Lorenzo Bravi:
* http://www.lorenzobravi.com/projects/workshop-isia/
*/

float v; 
float easing = 0.2;  // Between 0 and 1
float volumeScalar = 1500;
boolean mic = false; // change to switch between mouse or mic control

void setup() {
  size(500, 500);
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


