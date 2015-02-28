
void setup() {
  size(600, 600);
  smooth();
  noStroke();
}

void draw() {
  background(0);
  fill(255, 0, 0);
  rect(80, 200, 200, 200);
  fill(0, 0, 255);
  ellipse(420, height/2, 200, 200);

  if ( ( mouseX > 80) && ( mouseX < 280)) {
    background(0);
    noFill();
    stroke(random(255), random(0), random(0));
    strokeWeight(15);
    strokeJoin(ROUND);
    rect(80, 200, 200, 200);
    noStroke();
    fill(0, 0, 255);
    ellipse(420, height/2, 200, 200);
  }

  if ( ( mouseX > 320 ) && ( mouseX < 520 )) {
    background(0);
    noStroke();
    fill(255, 0, 0);
    rect(80, 200, 200, 200);
    noFill();
    stroke(random(0), random(0), random(255));
    strokeWeight(15);
    strokeJoin(ROUND);
    ellipse(420, height/2, 200, 200);
  }

  if ( ( mouseX > 520 ) && ( mouseX < 600 )) {
    background(0);
    noStroke();
    fill(255, 0, 0);
    rect(80, 200, 200, 200);
    fill(0, 0, 255);
    ellipse(420, height/2, 200, 200);
  }
}



