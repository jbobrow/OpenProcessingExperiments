

void setup()
{
  size(900, 400);
  smooth();
  rectMode(CENTER);
  noLoop();
}

void draw()
{
  background(240);
  float h = random(height*.45, height*.73);
  robot(width*.1, h);
  float h2 = random(height*.45, height*.73);
  robot(width*.3, h2);
  float h3 = random(height*.45, height*.73);
  robot(width*.5, h3);
  float h4 = random(height*.45, height*.73);
  robot(width*.7, h4);
  float h5 = random(height*.45, height*.73);
  robot(width*.9, h5);
}

void robot(float x, float y)
{
  pushMatrix();
  translate(x, y);

  // ANTENNAE
  float r = random(255);
  float g = random(255);
  float b = random(255);
  fill(r, g, b);
  strokeWeight(7);
  strokeCap(SQUARE);
  float lineX = random(30, 70);
  float lineY = random(150, 170);
  line(0, -75, -lineX, -lineY);
  line(0, -75, lineX, -lineY);
  strokeWeight(1.5);
  float ellipseW = random(12, 18);
  ellipse(-lineX, -lineY, ellipseW, ellipseW);
  ellipse(lineX, -lineY, ellipseW, ellipseW);

  // HELMET
  fill(240);
  float helmetH = random(120, 180);
  arc(0, -75, 130, helmetH, radians(180), radians(360));

  // HEAD
  float r2 = random(255);
  float g2 = random(255);
  float b2 = random(255);
  fill(r2, g2, b2);
  float headH = random(50, 85);
  float headW = random(50, 80);
  rect(0, -85, headW, headH);

  // BODY
  float bodyW = random(35, 95);
  beginShape();
  vertex(-65, -75);
  vertex(-bodyW, 55);
  vertex(bodyW, 55);
  vertex(65, -75);
  endShape(CLOSE);

  // BODY LINES
  float bw = random(0, 200);
  fill(bw);
  beginShape();
  vertex(-63, -65);
  vertex(-63, -59);
  vertex(63, -59);
  vertex(63, -65);
  endShape(CLOSE);

  if (bodyW == 65) {
    beginShape();
    vertex(-bodyW, 37);
    vertex(-bodyW, 43);
    vertex(bodyW, 43);
    vertex(bodyW, 37);
    endShape(CLOSE);
  }

  if (bodyW > 70) {
    beginShape();
    vertex(-bodyW, 37);
    vertex(-bodyW-.25, 43);
    vertex(bodyW+.25, 43);
    vertex(bodyW, 37);
    endShape(CLOSE);
  }

  if (bodyW < 70) {
    beginShape();
    vertex(-bodyW, 37);
    vertex(-bodyW+1, 43);
    vertex(bodyW-1, 43);
    vertex(bodyW, 37);
    endShape(CLOSE);
  }

    // HEART
    pushMatrix();
    float heartS = random(.5, 2);
    scale(heartS);
    fill(r, g, b);
    heart(-4, -15);
    popMatrix();

    float faceH = random(0, -50);
    face(0, faceH);

    // "LEGS"
    noFill();
    float bw3 = random(0, 200);
    stroke(bw3);
    strokeWeight(2);
    line (-bodyW+5, 65, bodyW-5, 65);
    line (-bodyW+10, 75, bodyW-10, 75);
    line (-bodyW+15, 85, bodyW-15, 85);
    line (-bodyW+20, 95, bodyW-20, 95);
    line (-bodyW+25, 105, bodyW-25, 105);

    popMatrix();
  }

  void heart(float x, float y) 
  {
    pushMatrix();
    translate(x, y);
    noStroke();
    ellipse(0, 0, 11, 11);
    ellipse(10, 0, 11, 11);
    triangle(-5.75, 1, 15.75, 1, 5, 15);
    popMatrix();
  }

  void face(float x, float y)
  {
    pushMatrix();
    noStroke();
    translate(x, y);
    float bw2 = random(0, 200);
    fill(bw2);
    ellipse(13, -100, 5, 5);
    ellipse(-13, -100, 5, 5);
    arc(0, -92, 18, 20, radians(0), radians(180));
    popMatrix();
  }

  void mousePressed()
  {
    redraw();
  }


