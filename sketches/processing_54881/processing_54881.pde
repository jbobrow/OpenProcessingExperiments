
float x, y;
float spdX, spdY;
float wind;



void setup() {
  size(600, 600);
  background(139, 199, 250);
  noStroke();
  x = width/2;
  y = height+50;
  spdX=0.0;
  spdY=-0.5;
  wind=0.01;
}

void draw() {
  background(139, 199, 250);

  drawCloud(100, 100);
  drawCloud(500, 300);
  drawCloud(400, 50);

  drawBalloon(x, y);

  drawCloud(75, 430);
  drawCloud(425, 500);
  drawCloud(235, 250);

  spdX += wind;
  x += spdX;
  y += spdY;
  
  if (x <  (width/4)) {
     wind = 0.01;
     spdX /= 1.01;
  }
  
  if (x > (3 * (width/4))) {
     wind = -0.01;
     spdX /= 1.01; 
  }
  
}

void drawCloud(int x, int y) {
  pushMatrix();
  translate (x, y);
  fill(240, 242, 245);
  ellipse(-15, -25, 50, 50);
  ellipse(0, 0, 135, 65);
  ellipse(20, 20, 50, 50);
  ellipse(-20, 20, 50, 50);
  ellipse(30, -20, 50, 50);
  ellipse(45, 0, 50, 50);
  ellipse(-45, 0, 50, 50);
  popMatrix();
}

void drawBalloon(float x, float y) {
  pushMatrix();
  translate (x, y);

  fill(255, 0, 0);
  ellipse(0, 0, 50, 65);

  beginShape();
  vertex(0, 25);
  vertex(-5, 40);
  vertex(5, 40);
  endShape();

  noFill();
  stroke(0);
  strokeWeight(3);
  curve(0, 0, -1, 30, 5, 120, 150, 320);
  noStroke();
  popMatrix();
}


