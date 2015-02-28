
/*
BabaYagaHouse06Function
"Baba Yaga House, version 06 with Functions"
 
An object to be used for continuing examples
in the Processing course.
By Barton Poulson
18 October 2011

Now a function.
 
*/
 
int numHouse = 3;                                     // Choose the number of hosues to draw. 
 
void setup() {
  size(450, 450);                                     // Canvas is square of 450 pixels on each side.
  background(#B87333);                                // Flat orange background.
  noLoop();                                           // Runs through draw only once.

}

void draw() {
// The babaHouse function takes 6 arguments, all floats: x, heightLegs, r, g, b, a.
  for (int i = 0; i < numHouse; i ++) {
    babaHouse(((i+1)*(width/(numHouse+1))),                                 // sets x for each house
      random(0, 150), random(255), random(255), random(255), random(255));  // sets r, g, b, a randomly
  }
}


