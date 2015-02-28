
/*
Pearlyn Lii
 ID 3 - Spring 2013
 1/31/13
 */
 
//declare global variables -----
 
float i = 0;
float j = 0;
float k = 0;
float a = 0;
float b = 500;
float c = 500;
float d = 0;

 
//setup -----
 
void setup() {
  background(200);
  size(500, 500);
  smooth();
  strokeWeight(2);
}
 
//draw -----
 
void draw() {

 
  //_____________________________

  //changes color increment
        k = k + 1;
  if (k> 300) {
    k = 0;
  }
  
 stroke(0, k, 100, 30); //changes color range
 
 
      a = a + 1;
  if (a > 500) {
    a = 0;
  }

      b = b - 1;
  if (b < 0) {
    b = 500;         
  }
  

  line(0, a, b, 0);  //render  A


}


