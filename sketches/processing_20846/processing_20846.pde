
float s;
float sMapped;

float g = random (0, 100);
float r = random (0, 100);
float b = random (0, 100);

void setup() {
  background(255);
  size(640,480);
  smooth();
   noStroke();

  // to catch up //
  int s = second();
  int drawSecond = 0;
 
  while  (drawSecond <= s) {
     sMapped = map(drawSecond, 0, 60, 0, height);
     pickColor();
     for (int i=0; i<60; i++) {
     rect(0,height-sMapped-10, 640, 10);
     }
     drawSecond += 1; 
  }
}



void draw() {
 // float g = random (0, 100);
 // float r = random (0, 100);
  //float b = random (0, 100);
 
  float s = second();
  sMapped = map(s, 0, 60, 0, height);
 
  pickColor(); 
  rect(0,height-sMapped-10, 640, 10);
  
if (s >= 59) {
  background(255);
}
  
}


void pickColor() {
  float g = random (0, 100);
  float r = random (0, 100);
  float b = random (0, 100);
  if (sMapped < 40) {
  fill(r, 46, b++, 8);
  }
  
  if (40 < sMapped && sMapped < 80) {
    fill(r++, g/5, 45, 8);
  }
  if (80 < sMapped && sMapped < 120) {
    fill(r++/2, g, 48, 8);
  }
  
  if (120 < sMapped && sMapped < 160) {
    fill(r, g/4, 32, 8);
  }
  
  if (160 < sMapped && sMapped < 200) {
    fill(r++/3, 25, 35, 8);
  }
  
 if (200 < sMapped && sMapped < 240) {
   fill(49, 43, b++/2, 8);
 }
 if (240 < sMapped && sMapped < 280) {
   fill(r ++, 29, 47, 8);
 }
 if (280 < sMapped && sMapped < 320) {
   fill(r++/4, 56, 50, 8);
 }
 
 if (320 < sMapped && sMapped < 360) {
   fill(r, 24, b++, 8);
 }
 if (360 < sMapped && sMapped < 400) {
   fill (r*2, 34, 46, 8);
 }
 if (400 < sMapped && sMapped < 440) {
   fill (r++/3, g/2, 78, 8);
 }
 if (440 < sMapped && sMapped < 480) {
   fill (r, g++, 43, 8);
 } 
}






