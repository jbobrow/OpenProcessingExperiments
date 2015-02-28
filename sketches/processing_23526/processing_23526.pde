
int value = 0;
int valueswitch = 0;
String bgr = "238,233,233";

void setup() {
  size(500, 500);
  background(238,233,233);
  smooth();
}

void draw() {
  /*fill(value);
   rect(25, 25, 50, 50);*/
  if (mousePressed && mouseButton == LEFT) {
    for (int w1 = 200, h1 = 200; w1 > 0; w1 = w1 - 10, h1 = h1 - 10) {
      fill(value);
      ellipse(mouseX, mouseY, w1, h1);
    }
  }
  if (mousePressed && mouseButton == RIGHT) {
    background(238,233,233);
  }


  smooth();
  beginShape();
  fill(131,139,131);
  curveVertex(160,260);
  curveVertex(160,220);
  curveVertex(150,210);
  curveVertex(140,260);
  curveVertex(100,280);
  endShape(CLOSE);

  beginShape();
  curveVertex(230,260);
  curveVertex(240,220);
  curveVertex(250,210);
  curveVertex(260,260);
  curveVertex(290,260);
  endShape(CLOSE);

  fill(119,136,153);
  ellipse(200,250,101,101);

  fill(190,190,190);
  beginShape();
  vertex(200,200);
  bezierVertex(200,250,250,300,250,250);
  endShape(CLOSE);

  fill(190,190,190);
  beginShape();
  vertex(200,200);
  bezierVertex(200,250,150,300,150,250);
  endShape(CLOSE);
}

void mouseDragged() {
  if (mouseButton == LEFT) {
    if (valueswitch == 0) {
      value = value + 5;
    }
    else {
      value = value - 5;
    }
    
    if (value > 255) {
      valueswitch = 1;
    }
    if (value < 10) {
      valueswitch = 0;
    }
  }
}


