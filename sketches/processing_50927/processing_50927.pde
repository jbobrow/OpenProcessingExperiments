
/**
* Project 1 Template
* UCLA Design Media Arts, Fall 2011
* Prof. Casey Reas
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
float volumeScalar = 500;
boolean mic = true;
 
int faceIncrementer;
float xpos;
float ypos;
float t;
int AX;
int BX;
float a;
float b;
float delta;
float x, y;
int theHue; 
 
void setup() {
  size(500, 500);
  smooth();
  setupVolume();
   
    faceIncrementer = 0;
  xpos = width/2;
  ypos = height/2;
 // t = 10;
 
  float x = 0;
  float y = 0;
}
 
void draw() {
  background(255);
 
  getVolume();
   
  if (mic == false) {
    v = mouseX;
  }
   
//  else if( mic == true){
 //   v = s_volume;
 // }
   
  testFace();
  
  //saveFrame("mask-####.png");
}


