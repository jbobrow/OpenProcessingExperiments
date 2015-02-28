
// Konkuk University
// Department of Dynamic Media
// SOS iDesign
// Name: Hong Jiyae 
// ID: 201420117 

float angle;

void setup() {
  size(666, 666);
  smooth();
  // noLoop();
}
void draw() {
  noStroke();
  fill(0, 10);
  rectMode(LEFT);
  rect(0, 0, width, height);

  //noStroke();
  stroke(255);
  strokeWeight(3);

  translate(width/2, height/2);

  for (int i = 0; i < 50; i = i + 2) {
    rotate(radians(angle)); 
    scale(0.85);
    rectMode(CENTER);

    pushMatrix();
    stroke(255);
    fill(i*5,0,0);
    rect(0, 0, 500, 500, 20);
    fill(255);
    ellipse(230, 230, 20, 20);
    ellipse(-230, 230, 20, 20);
    ellipse(230, -230, 20, 20);
    ellipse(-230, -230, 20, 20);
    popMatrix();
  }
  angle = angle + 0.1;
}

