

void setup() {
  size(500, 500);
  background(42, 225, 176);
}



void draw() {
  //head
  fill(251, 232, 216);
  ellipseMode(CENTER);
  ellipse(250, 250, 250, 250);

  //right eye
  fill(255, 255, 255);
  ellipseMode(RADIUS);
  ellipse(150, 250, 10, 10);

  fill(21, 41, 8);
  ellipseMode(RADIUS);
  ellipse(150, 250, 5, 5);

  //left eye
  ellipseMode(RADIUS);
  fill(255, 255, 255);
  ellipse(350, 250, 10, 10);

  fill(21, 41, 8);
  ellipseMode(RADIUS);
  ellipse(350, 250, 5, 5);

  //nose
  ellipseMode(CENTER);
  fill(251, 232, 216);
  ellipse(250, 250, 30, 20);

  //mouth//(arc)

  arc(250, 280, 180, 140, 0, PI, CLOSE);
  fill(243, 74, 74);

  //hair

  fill(253, 199, 93);
  stroke(231, 122, 69);

  ellipseMode(CENTER);
  ellipse(250, 110, 20, 20);

  ellipseMode(CENTER);
  ellipse(220, 115, 20, 20);

  ellipseMode(CENTER);
  ellipse(190, 125, 20, 20);

  ellipseMode(CENTER);
  ellipse(160, 140, 20, 20);

  ellipseMode(CENTER);
  ellipse(130, 160, 20, 20);

  //
  ellipseMode(CENTER);
  ellipse(110, 215, 20, 20);

  ellipseMode(CENTER);
  ellipse(105, 245, 20, 20);
  ellipse(100, 275, 20, 20);

  ellipseMode(CENTER);
  ellipse(105, 310, 20, 20);



  ellipseMode(CENTER);
  ellipse(300, 115, 20, 20);

  ellipseMode(CENTER);
  ellipse(340, 130, 20, 20);

  ellipseMode(CENTER);
  ellipse(365, 160, 20, 20);

  ellipseMode(CENTER);
  ellipse(380, 185, 20, 20);

  ellipseMode(CENTER);
  ellipse(390, 215, 20, 20);

  ellipseMode(CENTER);
  ellipse(398, 250, 20, 20);
}

