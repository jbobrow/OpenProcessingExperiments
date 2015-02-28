
// Created by Fatima Zahrah Rashid for Interacivity 1.


void setup(){
  size(400,400); //size of sketch
  smooth();
  noStroke();
  frameRate (150); //speed of sketch
}
void draw(){
 fill(0, 2);  // background colour, alpha for motion blur
   rect(0,0,width,height); // background shape size of window
 fill(random (1,255),random (1,255),random (1,255),random (1,255));  // rect fill colour (random each frame)
   rect(random (0,width), random (0, height), random (1,30), random (1,30)); // rect size (each value is random with set parameters
   rect(random (0,width), random (0, height), random (1,30), random (1,30)); // rect size (each value is random with set parameters
   rect(random (0,width), random (0, height), random (1,30), random (1,30)); // rect size (each value is random with set parameters
   rect(random (0,width), random (0, height), random (1,30), random (1,30)); // rect size (each value is random with set parameters
}


