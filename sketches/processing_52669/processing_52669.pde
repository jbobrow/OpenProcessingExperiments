
// Mandala Lab
// 2 functions, 2 loops, 4 variables

void setup() {
  size(600, 600);
  smooth();
  stroke(0, 0, 50, 200);
}

void draw() {
  background(200, 250, 100);
  noFill();

  // if we don't want the transformations
  // to accumulate, then we use
  // push Matrix() and popMatrix();

  translate(width/2, height/2);
  rect(-120, - 120, 240, 240);

  createPoly();
  createSpiral();

  float moose = 0.0;
  float radiu = 450;
  fill(250, 75, 20, 50);
  for (int i=0; i<20; i++) {
    pushMatrix();
    translate(cos(moose)*radiu/3, sin(moose)*radiu/3);
    ellipse(0, 0, 100, 100);
    moose +=TWO_PI/20;
    popMatrix();
  }

  float tweet = 0.0;
  float radius4 = 300;
  fill(250, 25, 200, 150);
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(tweet)*radius4/3, sin(tweet)*radius4/3);
    ellipse(0, 0, 100, 100);
    tweet +=TWO_PI/12;
    popMatrix();
  }

  float meow = 0.0;
  float radius2 = 200;
  fill(200, 200, 0, 30);
  for (int i=0; i<62; i++) {
    pushMatrix();
    translate(cos(meow)*radius2/2, sin(meow)*radius2/2);
    ellipse(0, 0, 100, 100);
    meow +=TWO_PI/62;
    popMatrix();
  }

  float theta = 0.0;
  float radius = 70;
  fill(50, 250, 100, 100);
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(theta)*radius, sin(theta)*radius);
    ellipse(0, 0, 100, 100);
    theta +=TWO_PI/12;
    popMatrix();
  }

  float bark = 0.0;
  float radius3 = 50;
  fill(50, 20, 100, 50);
  for (int i=0; i<12; i++) {
    pushMatrix();
    translate(cos(bark)*radius3, sin(bark)*radius3);
    ellipse(0, 0, 100, 100);
    bark +=TWO_PI/12;
    popMatrix();
  }


  fill(200, 250, 100, 100);
  createSmallCircles();
}


