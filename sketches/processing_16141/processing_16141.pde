
/**
 exercise creating an array of floats with 
 a bunch of random input
 Philippe Moore
 September 08, 09
 EDIT: reworked to be slightly more elegant, also added 
 mouseClicked() functionality, go ahead, try it. :D
 11/29/10
 **/

float[] floats = new float[100];

void setup() { 
  size(400, 400); 
  smooth();
  newOne();
}

void draw() {
  
}
void mouseClicked() {newOne();}
void newOne() {
  background(125);
  for (int i = 0; i < floats.length; i++) {
    floats[i] = random(400);
  }
  for (int i = 1; i < floats.length; i++) {
    stroke(random(255));
    fill(i%255, floats[i]%255, 120);
    line(i*10, floats[i], (i-1)*10, floats[i-1]); 
    ellipse(i*10, floats[i], 5, 5);
    ellipse((i-1) * 10, floats[i-1], 5, 5);
  }
}


