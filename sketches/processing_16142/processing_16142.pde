
/**
 exercise creating an array of floats with 
 a bunch of random input
 Philippe Moore
 September 08, 09
 11/29/10
 EDIT: added mouseClicked() function to reset it.
 **/

float[] floats = new float[100];

void setup() { 
  size(1000, 400); 
  smooth();

  newOne();
}

void draw() {
}
void mouseClicked() {
  newOne();
}
void newOne() {
  background(100);
  for (int i = 0; i < floats.length; i++) {
    floats[i] = random(400);
  }

  for (int i = 1; i < floats.length-1; i++) {
    stroke(random(255));
    fill(i%255, floats[i]%255, 120);
    line(i*10, floats[i], floats[i], floats[i-1]); 
    line(floats[i], floats[i-1], (i+1)*10, floats[i+1]);
    ellipse(i*10, floats[i], 5, 5);
    ellipse(floats[i], floats[i-1], 5, 5);
  }
  println(floats);
}


