
float x = 50;
float y = 100;
float angle1 = 0.0;
float angle2 = 0.0;
float segLength = 50;

void setup() {
  size(600, 600);
  colorMode(RGB);
  smooth();
}
void draw() {
  grid();
  //background(102, 179, 255);
  stroke(0);
  fill(0, 0, 0);
  ellipse(width/2, 200, 50, 50);
  strokeWeight(30);
  fill(0, 0, 0);
  line(300, 210, 300, 380);
  line(300, 380, 250, 440);
  line(300, 380, 350, 440);
  line(300, 300, 240, 240);

  // The Arm
  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;

  pushMatrix();
  translate(250, 200);
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();

  if (key=='1')
  {
    fill(51, 204, 255);
    stroke(51, 204, 255);
  }

  if (key=='2')
  {
    fill(255, 102, 51);
    stroke(255, 102, 51);
  }

  if (key=='3')
  {
    fill(255, 51, 102);
    stroke(255, 51, 102);
  }

  ellipse(width/2, 200, 50, 50);
  line(300, 210, 300, 380);
  line(300, 380, 250, 440);
  line(300, 380, 350, 440);
  line(300, 300, 240, 240);

  angle1 = (mouseX/float(width) - 0.5) * -PI;
  angle2 = (mouseY/float(height) - 0.5) * PI;

  pushMatrix();
  translate(250, 200);
  segment(x, y, angle1); 
  segment(segLength, 0, angle2);
  popMatrix();
}

void segment(float x, float y, float a) {
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
}

void grid() {
  pushMatrix();
  // Grid 1
  translate(10, 45);
  rotate(50);
  noStroke();
  for (int x=0;x<width;x+=40) {
    for (int y=0;y<height;y+=40) {
      fill(random(35)+255, 100);
      rect(x, y, 100, 100);
    }
  }
  // Grid 2
  translate(30, 80);
  rotate(200);
  noStroke();
  for (int x=0;x<width;x+=40) {
    for (int y=0;y<height;y+=40) {
      fill(random(30)+55, 100);
      rect(x, y, 100, 100);
    }
  }
  // Grid 3
  translate(180, 80);
  rotate(360);
  noStroke();
  for (int x=0;x<width;x+=40) {
    for (int y=0;y<height;y+=40) {
      fill(random(25)+100, 100);
      rect(x, y, 100, 100);
    }
  }
  // Grid 4
  translate(180, 80);
  rotate(360);
  noStroke();
  for (int x=0;x<width;x+=40) {
    for (int y=0;y<height;y+=40) {
      fill(random(25)+200, 100);
      rect(x, y, 100, 100);
    }
  }
  popMatrix();
}


