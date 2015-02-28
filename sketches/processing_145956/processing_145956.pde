
void setup() {
  size(500,500);
  smooth();
}

void draw() {
  background(255);

  pushMatrix(); // start clock face context
  translate(250,250);
  stroke(0);
  strokeWeight(4);
  noFill();
  ellipse(0,0,400,400);

  pushMatrix(); // start tick marks context
  for(int i=0; i<60; i++) {
    if(i%5==0) largeTick();
    else smallTick();
    rotate(radians(6));
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
  ellipse(0,0,20,20);

  popMatrix(); // end clock face context
}

void smallTick() {
  stroke(0,0,255);
  strokeWeight(2);
  line(170,0,190,0);
}

void largeTick() {
  stroke(0);
  strokeWeight(3);
  line(165,0,190,0);
}

void secondHand() {
  stroke(255,0,0);
  strokeWeight(1);
  line(0,0,175,0);
}

void minuteHand() {
  stroke(0);
  strokeWeight(3);
  line(0,0,160,0);
}

void hourHand() {
  stroke(0);
  strokeWeight(5);
  line(0,0,80,0);
}


