
//Project: Oscillating Circles
//Assignment: something that shows or plays with osciallation
//class: AVSYS Spring 2013

float y1, y2;
float angle1, angle2;

void setup() {
  size(800, 600);
  noStroke();
  rectMode(CENTER);
}

void draw() {
  background(255);

  float ang1 = radians(angle1);
  float ang2 = radians(angle2);

  y1 = height/2 + (300*sin(ang1));
  y2 = height/2 + (10*sin(ang2));

  for (int i=0; i<30; i++) {
    stroke(0);
    noFill();
    ellipse(50*i, y1, random(80, 95), random(80, 95));
    fill(0);
    ellipse(50*i, y2, random(10, 12), random(10, 12));
  }

  angle1 += 3;
  angle2 += 3;

  if (mouseY < width/3 || mouseY > width*2/3) {
    angle1 += 20;
  }
}

