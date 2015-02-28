
Write [] writes = new Write[10];

void setup() {
  size(500, 500);
  smooth();
  background(0);

  for (int a=0; a < writes.length; a++) {
    writes[a] = new Write();
  }
}

void draw() {
  for (int a=0; a < writes.length; a++) {
    writes[a].display(); //draws the first man
    writes[a].update();  //keeps piling on the men
  }
}


class Write {
  //places the heads
  float x= random(width);
  float y= random(width);

  Write() {
  }

  void display() {
    angryParris(x, y);
  }


  void update() {
    x= random(-20, width);
    y= random(-20, height);
  }
}



void angryParris(float x, float y) {
  translate(x, y);

  //hair
  ellipseMode(CORNER);
  fill(0);
  stroke(0);
  ellipse(20, 5, 150, 130);

  //face
  fill(245, 165, 143);
  noStroke();
  rect(70, 30, 60, 80);
  stroke(0);
  strokeWeight(2);

  //eyes
  line(83, 50, 92, 55);
  line(109, 55, 118, 50);
  strokeWeight(5);
  stroke(72, 18, 4);
  point(87.5, 61);
  point(113.5, 61);

  //facial features
  stroke(0);
  strokeWeight(1);
  line(100, 55, 100, 80);
  line(100, 80, 106, 80);
  line(106, 80, 106, 77);
  line(92, 77, 92, 80);
  line(92, 80, 96, 80);
  fill(245, 165, 143);
  rect(90, 90, 20, 3);
  rect(89, 93, 22, 5);
  strokeWeight(6);
  stroke(0, 0, 0, 170);
  line(100, 101, 100, 110);
  line(70, 109, 130, 109);
  strokeWeight(4);
  line(89, 88, 111, 88);
}


