
PImage C;

void setup(){
  size (615, 640);
  C = loadImage("cami.jpg");
  image(C, 0, 0);
}

void draw(){
  int s = second();  // Values from 0 - 59
  int m = minute();  // Values from 0 - 59
  int h = hour();    // Values from 0 - 23
 
 s += map(s, 0, 60, 0, width);
 C.filter(GRAY);
 copy(C, s, 0, 12, height, s, 0, 12, height);
 updatePixels();
  
}

