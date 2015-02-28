
void setup() {
  size(500, 500);
  smooth();
}

void draw() {
  pushMatrix(); // start clock face context
  translate(height/2, width/2); // move to centre
  stroke(0); // line colour
  strokeWeight(5); // line weight
  fill(255); // fill colour
  ellipse(0, 0, 400, 400); // shape of clock face

  pushMatrix(); // start tick marks context
  for (int i=0; i<60;i++) {
    if (i%5==0) largeTick(); // every 5 i's follow "largeTick" instructions
    else smallTick(); // everything else follow "smallTick" instructions
    rotate(radians(6)); // rotate by 6 radians?
  }
  popMatrix(); // end tick marks context

  pushMatrix(); // start secondHand context
  rotate(radians(6*second()-90));
  secondHand();
  popMatrix(); // end secondHand context

  pushMatrix(); // start minuteHand context
  rotate(radians(6*(minute()+second()/60.0)-90));
  minuteHand();
  popMatrix(); // end minuteHand context

  pushMatrix(); // start hourHand context
  rotate(radians(30*(hour()+minute()/60.0)-90));
  hourHand();
  popMatrix(); // end hourHand context

  // center button
  fill(0);
  noStroke();
  ellipse(0, 0, 15, 15);

  popMatrix(); // end clock face content
}
void smallTick() {
  strokeWeight(2); // tick weight
  line(170, 0, 185, 0); // tick length
}

void largeTick() {
  strokeWeight(2); // tick weight
  line(100, 0, 200, 0); // tick length
}

void secondHand() {
  strokeWeight(1); // hand weight
  strokeCap(SQUARE);
  line(0, 0, 175, 0); // hand length
}

void minuteHand() {
  strokeWeight(3); // hand weight
  strokeCap(SQUARE);
  line(-40, 0, 160, 0); // hand length
}

void hourHand() {
  strokeWeight(8); // hand weight
  strokeCap(SQUARE);
  line(-30, 0, 100, 0); // hand length
}



