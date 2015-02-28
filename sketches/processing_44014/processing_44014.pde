
//R.A. Robertson 2011.10, "Bezier Illustrated."
float c1x, c1y, c2x, c2y, d, dist1, dist2;
boolean hover1, hover2 = false;
boolean grab1, grab2 = false;

void setup() {
  size(800, 400);
  frameRate(30);
  noFill();
  smooth();
  background(0);

  c1x = random(width);
  c1y = random(height);
  c2x = random(width);
  c2y = random(height);
  d = 20;
}

void draw() {
  background(0, 1);

  stroke (0, 0, 250, 155);
  noFill();
  bezier(200, height/2, c1x, c1y, c2x, c2y, 600, height/2);

  dist1 = dist(mouseX, mouseY, c1x, c1y);
  dist2 = dist(mouseX, mouseY, c2x, c2y);

  if (dist1 <= d/2) {
    hover1 = true;
  } 
  else {
    hover1 = false;
  }

  if (dist2 <= d/2) {
    hover2 = true;
  } 
  else {
    hover2 = false;
  }

  stroke(0, 255, 0, 155);
  if (hover1) { 
    stroke(0, 255, 0);
  }
  ellipse(c1x, c1y, d, d);
  stroke(0, 255, 0, 155);
  if (hover2) { 
    stroke(0, 255, 0);
  }
  ellipse(c2x, c2y, d, d);
  stroke(255, 0, 0, 155);
  line(200, height/2, c1x, c1y);
  line(600, height/2, c2x, c2y);
}

void mousePressed() {
  if (hover1) { 
    grab1 = true;
  }
  else {
    grab1 = false;
  }
  if (hover2) { 
    grab2 = true;
  }
  else {
    grab2 = false;
  }
}

void mouseDragged() {
  if (grab1) {
    c1x = mouseX; 
    c1y = mouseY;
  }
  if (grab2) {
    c2x = mouseX; 
    c2y = mouseY;
  }
}

void mouseReleased() {
  grab1 = grab2 = false;
}




