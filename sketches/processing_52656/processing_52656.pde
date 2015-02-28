

void setup() {
  size(600, 600);
  smooth();
  background(75, 6, 188);

  strokeWeight(80);
  stroke(109, 23, 232, 50);
  fill(32, 12, 167);
  circles(360.0, 120);

  strokeWeight(40);
  stroke(0, 150);
  noFill();
  circles(350.0, 120);

  strokeWeight(40);
  stroke(0, 150);
  noFill();
  circles(240.0, 120);

  strokeWeight(60);
  stroke(0, 118, 22, 50);
  fill(32, 178, 60);
  circles(250.0, 120);

  strokeWeight(60);
  stroke(105, 167, 12, 90);
  fill(207, 232, 23);
  circles(140.0, 120);

  strokeWeight(60);
  stroke(255, 223, 36, 50);
  fill(255, 162, 39);
  circles(90.0, 120);

  strokeWeight(40);
  stroke(255, 96, 39, 50);
  fill(255, 36, 3);
  circles(40.0, 120);

  strokeWeight(5);
  stroke(random(255), random(255), random(255));
  pointyLines(200, 200);

  strokeWeight(5);
  stroke(20);
  pointyLines(10, 70);
}

void circles(float radius, int sides) {

  float theta = -PI/2;
  float xPos = width/2;
  float yPos = height/2;
  int counter = 0;
  beginShape();

  while (counter < sides) {
    translate(cos(theta)*radius, sin(theta)*radius);
    float x = xPos + cos(theta) * radius;
    float y = yPos + sin(theta) * radius; 
    vertex(x, y);
    counter = counter + 1;
    theta = theta + TWO_PI/sides;
  }

  endShape();
}


void pointyLines(float radius, int sides) {

  float theta = -PI/2;
  float xPos = width/2;
  float yPos = height/2;
  int counter = 0;

  while (counter < sides) {
    beginShape();
    float x = xPos + cos(theta) * radius;
    float y = yPos + sin(theta) * radius;
    float x2 = xPos + cos(theta) * radius * 90;
    float y2 = yPos + sin(theta) * radius * 90; 
    vertex(x, y);
    vertex(x2, y2);
    counter = counter + 1;
    theta = theta + TWO_PI/sides;
    endShape();
  }
}


