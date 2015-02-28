

class Robot
{ 
  float x, y, sbw;
  float r = random(0, 255);
  float g = random(0, 255);
  float b = random(0, 255);
  float r2 = random(0, 255);
  float g2 = random(0, 255);
  float b2 = random(0, 255);
  float r3 = random(0, 255);
  float g3 = random(0, 255);
  float b3 = random(0, 255);
  float lineX = random(30, 70);
  float lineY = random(150, 170);
  float ellipseW = random(12, 18);
  float helmetH = random(120, 180);
  float headH = random(50, 85);
  float headW = random(50, 80);
  float bodyW = random(35, 95);
  float bw = random(0, 200); //blackwhite
  float bw2 = random(0, 200);
  float heartS = random(.5, 2);

  Robot(float xpos, float ypos, float tempSBW)
  { 
    x = xpos;
    y = ypos;
    sbw = tempSBW;
  }

  void antennae()
  {
    translate(x, y);
    fill(r, g, b);
    strokeWeight(7);
    strokeCap(SQUARE);
    stroke(sbw);
    line(0, -75, -lineX, -lineY);
    line(0, -75, lineX, -lineY);
    strokeWeight(1.5);
    ellipse(-lineX, -lineY, ellipseW, ellipseW);
    ellipse(lineX, -lineY, ellipseW, ellipseW);
  }

  void helmet()
  {
    strokeWeight(1.5);
    stroke(sbw);
    fill(240);
    arc(0, -75, 130, helmetH, radians(180), radians(360));
  }

  void head()
  {
    strokeWeight(1.5);
    stroke(sbw);
    fill(r2, g2, b2);
    rect(0, -85, headW, headH);
  }

  void body()
  {
    strokeWeight(1.5);
    stroke(sbw);
    beginShape();
    vertex(-65, -75);
    vertex(-bodyW, 55);
    vertex(bodyW, 55);
    vertex(65, -75);
    endShape(CLOSE);

    // body lines
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

    // "legs""

    noFill();
    strokeWeight(2);
    line (-bodyW+5, 65, bodyW-5, 65);
    line (-bodyW+10, 75, bodyW-10, 75);
    line (-bodyW+15, 85, bodyW-15, 85);
    line (-bodyW+20, 95, bodyW-20, 95);
    line (-bodyW+25, 105, bodyW-25, 105);
  }

  void heart(float x, float y)
  {
    pushMatrix();
    translate(x, y);
    scale(heartS);
    fill(r3, g3, b3);
    noStroke();
    ellipse(-.25, 0, 11, 11);
    ellipse(9.75, 0, 11, 11);
    triangle(-5.75, 1, 15.75, 1, 5, 15);
    stroke(0);
    popMatrix();
  }

  void face()
  {
    pushMatrix();
    noStroke();
    fill(bw2);
    ellipse(13, -100, 5, 5);
    ellipse(-13, -100, 5, 5);
    arc(0, -92, 18, 20, radians(0), radians(180));
    stroke(0);
    popMatrix();
  }

  void motion(float speed)
  {
    y = cos(frameCount/speed) * 50;
  }
}


