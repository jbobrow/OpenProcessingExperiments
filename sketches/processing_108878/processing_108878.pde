
float target = 0.0;
float now1 = 0.0;
float now2 = 10.0;
float now3 = 0.0;
float v = 0.0;

void setup() {
  size(440,440);
  smooth();
}

void draw() {
  background(255);
  stroke(0);
  strokeWeight(2.0);
  float qt = height/5;
//  if(mousePressed) 
  target = mouseX;
  // none
  line(0, qt, target, qt);
  ellipse(target,qt,5,5);
  // ease
  now1 = now1+(target-now1)*0.1;
  line(0, qt*2, now1, qt*2);
  ellipse(now1,qt*2,5,5);
  // linear
  now2 = now2+constrain(target-now2,-5,5);
  line(0, qt*3, now2, qt*3);
  ellipse(now2,qt*3,5,5);
  // cubic
  v += (target-now3)*0.1;
  v *= 0.8;
  now3 = now3+v;
  line(0, qt*4, now3, qt*4);
  ellipse(now3,qt*4,5,5);
}
