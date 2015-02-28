
// testing parameters of arc()
// schien@mail.ncku.edu.tw

void setup() {
  size(200, 200);
}

void draw() {
  background(200);  // added for smoothness
  fill(255);  // added to make sure fill color differs from background

  // demo code from processing reference
  arc(50, 55, 50, 50, 0, HALF_PI);
  noFill();
  arc(50, 55, 60, 60, HALF_PI, PI);
  arc(50, 55, 70, 70, PI, PI+QUARTER_PI);
  arc(50, 55, 80, 80, PI+QUARTER_PI, TWO_PI);
  
  fill(255);
  // adjusted from demo code
  arc(50+width/2, 50, 80, 80, 0, PI+QUARTER_PI, OPEN);
  arc(50, 50+height/2, 80, 80, 0, PI+QUARTER_PI, CHORD); // not showing on browser
  arc(50+width/2, 50+height/2, 80, 80, 0, PI+QUARTER_PI, PIE); // not showing on browser
}



