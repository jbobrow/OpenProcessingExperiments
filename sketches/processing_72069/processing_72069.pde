
void setup() {
  size(600, 600);
  smooth();
  colorMode(HSB, 600);
  background(0);
}
void draw() {


  //Random Variable for Smooth Line Erase/Fade
  float R = random(600);
  float E = random(600);
  float W = random(600);
  float Q = random(600);
  float A = random(600);
  float S = random(600);
  //Eraser
  line(0, R, 600, R); 
  line(0, E, 600, E); 
  line(0, W, 600, W); 
  line(0, Q, 600, Q); 
  line(0, S, 600, S);
  line(R, 0, R, 600);
  line(Q, 0, Q, 600);

  //Ellipse Tool and Hue Orientation
  float D = random(100);
  if (mousePressed == true) {
    fill(mouseX, mouseY, mouseX, mouseY);
    noStroke();
    ellipse(mouseX, mouseY, D, D);
    println (mouseX);
  }
  else {
    stroke(0, 0, 0, random(600));
  }
}
