
PVector pos;
float rot;


void setup() {
  size(700, 400);
  pos = new PVector(width/2, height/2);
}

void draw() {
  background(20);
  int s = second();
  int m = minute();
  int h = hour();


  fill(30);
  noStroke();
  ellipse(width/2, height/2, 250, 250);
  fill(220);
  /*pushMatrix();
  translate(pos.x, pos.y);
  rotate(PI);
  rotate(radians(s * 6));
  rectMode(CORNER);
  rot ++;
  rect(0, 0, 1, 103, TWO_PI);
  popMatrix();*/

  pushMatrix();
  translate(pos.x, pos.y);
  rectMode(CORNER);
  rot++;
  rotate(PI);
  rotate(radians(m * 6));
  rect(-.5, 0, 2, 100, TWO_PI);
  popMatrix();

  pushMatrix();
  translate(pos.x, pos.y);
  rectMode(CORNER);
  rot++;
  rotate(PI);
  rotate(radians((h * 30)+((m/12) * 6)));
  rect(-2, 0, 5, 80, TWO_PI);
  popMatrix();


  strokeWeight(3);
  for (int a = 0; a < 360; a+=6) {

    beginShape(POINTS);
    if ((a/6) == (s)) {
      stroke (124, 252, 0);
    } 
    else {
      stroke(50);
    }
    float angle = radians(a);
    float x = width/2 + cos(angle) * 115;
    float y = height/2 + sin(angle) * 115;
    vertex(x, y);
  }
  endShape();
}





