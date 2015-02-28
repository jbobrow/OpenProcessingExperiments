
int lastSecond = 0;
float btH;
float btV;

void setup() {
  size(1024, 768, P2D);
  lastSecond = second();
  ellipseMode(CENTER);
  rectMode(CENTER);
  colorMode(HSB);
}

void drawBottleTop() {

  noFill();
  beginShape();
  curveVertex(width/2, 48);
  curveVertex(width/2, 48);
  curveVertex(width/2+30, 50);
  curveVertex(width/2+40, 72);
  curveVertex(width/2+40, 72);
  endShape();

  beginShape();
  curveVertex(width/2, 48);
  curveVertex(width/2, 48);
  curveVertex(width/2-30, 50);
  curveVertex(width/2-40, 72);
  curveVertex(width/2-40, 72);
  endShape();

  beginShape();
  curveVertex(width/2+40, 72);
  curveVertex(width/2+40, 72);
  curveVertex(width/2, 77);
  curveVertex(width/2-40, 72);
  curveVertex(width/2-40, 72);
  endShape();
}



void drawBottleShoulder() {
  beginShape();
  curveVertex(width/2-40, 72);
  curveVertex(width/2-40, 72);
  curveVertex(width/2-btV, btH);
  curveVertex(width/2-btV, btH+20);
  curveVertex(width/2-btV, btH+20);
  endShape();

  beginShape();
  curveVertex(width/2+40, 72);
  curveVertex(width/2+40, 72);
  curveVertex(width/2+btV, btH);
  curveVertex(width/2+btV, btH+20);
  curveVertex(width/2+btV, btH+20);
  endShape();

  //  beginShape();
  //  curveVertex(width/2-btV, btH+20);
  //  curveVertex(width/2-btV, btH+20);
  // curveVertex(width/2, btH+25);
  //  curveVertex(width/2+btV, btH+20);
  //curveVertex(width/2, btH+15);
  // curveVertex(width/2-btV, btH+20);
  // curveVertex(width/2-btV, btH+20);
  // endShape();
}

void drawBottleTopContainer() {

  beginShape();
  curveVertex(width/2-btV, btH+20);
  curveVertex(width/2-btV, btH+20);
  curveVertex(width/2-btV-20, btH+50);
  curveVertex(width/2-btV-20, btH+160);
  curveVertex(width/2-btV-20, btH+160);
  endShape();

  beginShape();
  curveVertex(width/2+btV, btH+20);
  curveVertex(width/2+btV, btH+20);
  curveVertex(width/2+btV+20, btH+50);
  curveVertex(width/2+btV+20, btH+160);
  curveVertex(width/2+btV+20, btH+160);
  endShape();
}

void drawBottleContainer() {

  beginShape();
  curveVertex(width/2-btV-20, btH+160);
  curveVertex(width/2-btV-20, btH+160);
  curveVertex(width/2-btV-20, 140+btH+btV);
  curveVertex(width/2-btV-btH/3, btV+300+btH);
  curveVertex(width/2-btV-20, 576);
  curveVertex(width/2-btV-20, 576);
  endShape();

  beginShape();
  curveVertex(width/2+btV+20, btH+160);
  curveVertex(width/2+btV+20, btH+160);
  curveVertex(width/2+btV+20, 140+btH+btV);
  curveVertex(width/2+btV+btH/3, btV+300+btH);
  curveVertex(width/2+btV+20, 576);
  curveVertex(width/2+btV+20, 576);
  endShape();

  beginShape();
  curveVertex(width/2-btV-20, 140+btH+btV);
  curveVertex(width/2-btV-20, 140+btH+btV);
  curveVertex(width/2, 140+btH+btV+10);
  curveVertex(width/2+btV+20, 140+btH+btV);
  curveVertex(width/2, 140+btH+btV);
  curveVertex(width/2-btV-20, 140+btH+btV);
  curveVertex(width/2-btV-20, 140+btH+btV);
  endShape();
}

void drawBottleBottom() {


  beginShape();
  curveVertex(width/2-btV-20, 576);
  curveVertex(width/2-btV-20, 576);
  curveVertex(width/2-btV-10, 608);
  curveVertex(width/2, 616);
  curveVertex(width/2, 616);
  endShape();

  beginShape();
  curveVertex(width/2+btV+20, 576);
  curveVertex(width/2+btV+20, 576);
  curveVertex(width/2+btV+10, 608);
  curveVertex(width/2, 616);
  curveVertex(width/2, 616);
  endShape();

  beginShape();
  curveVertex(width/2-btV-20, 576);
  curveVertex(width/2-btV-20, 576);
  curveVertex(width/2, 586);
  curveVertex(width/2+btV+20, 576);
  curveVertex(width/2, 576);
  curveVertex(width/2-btV-20, 576);
  curveVertex(width/2-btV-20, 576);
  endShape();
}

void drawCounter() {
  line(0, 516, width, 516);
  line(0, 640, width, 640);
  fill(0);
  rect(width/2, 640, width, 10);
}

void drawFluid(float H, float S, float B) {
  fill(H, S, B, 200);
  beginShape();
  curveVertex(width/2-btV-20, btH+160);
  curveVertex(width/2-btV-20, 140+btH+btV);
  curveVertex(width/2-btV-btH/3, btV+300+btH);
  curveVertex(width/2-btV-20, 576);  
  curveVertex(width/2-btV-10, 608);
  curveVertex(width/2, 616);
  curveVertex(width/2+btV+10, 608);
  curveVertex(width/2+btV+20, 576);
  curveVertex(width/2+btV+btH/3, btV+300+btH);
  curveVertex(width/2+btV+20, 140+btH+btV);
  curveVertex(width/2+btV+20, btH+160);
  endShape();
}

void drawLabel(float H, float S, float B) {
  fill(H, S, B, 255);
  if (btV < 50) {
    rect(width/2, 140+btH+btV+10, 30+btV, 100+btH);
  } 
  else if (btV > 100) {   
    rect(width/2, 140+btH+btV+10, 100+btV, 100+btH);
  }
  else {
    rect(width/2, 140+btH+btV+10, 70+btV, 100+btH);
  }
}


void drawControlPoints() {
  //top
  ellipse(width/2+30, 48, 5, 5);
  ellipse(width/2+40, 72, 5, 5);
  ellipse(width/2, 48, 5, 5);
  ellipse(width/2-30, 48, 5, 5);
  ellipse(width/2-40, 72, 5, 5);

  //shoulder 
  ellipse(width/2-40, 72, 5, 5);
  ellipse(width/2-btV, btH+20, 5, 5);
  ellipse(width/2-btV, btH, 5, 5);
  ellipse(width/2+40, 72, 5, 5);
  ellipse(width/2+btV, btH, 5, 5);
  ellipse(width/2+btV, btH+20, 5, 5);

  //top-cont
  ellipse(width/2-btV, btH+20, 5, 5);
  ellipse(width/2-btV-20, 160, 5, 5);
  ellipse(width/2-btV-20, btH+160, 5, 5);
  ellipse(width/2+btV, btH+20, 5, 5);
  ellipse(width/2+btV+20, 160, 5, 5);
  ellipse(width/2+btV+20, btH+160, 5, 5);

  //cont

  ellipse(width/2-btV-20, btH+160, 5, 5);
  ellipse(width/2-btV-20, 140+btH+btV, 5, 5);
  ellipse(width/2-btV-btH/3, btV+300+btH, 5, 5);
  ellipse(width/2-btV-20, 576, 5, 5);
  ellipse(width/2+btV+20, btH+160, 5, 5);
  ellipse(width/2+btV+20, 140+btH+btV, 5, 5);
  ellipse(width/2+btV+btH/3, btV+300+btH, 5, 5);
  ellipse(width/2+btV+20, 576, 5, 5);

  //bottom
  ellipse(width/2-btV-20, 576, 5, 5);
  ellipse(width/2-btV-10, 608, 5, 5);
  ellipse(width/2, 616, 5, 5);
  ellipse(width/2+btV+20, 576, 5, 5);
  ellipse(width/2+btV+10, 608, 5, 5);
  ellipse(width/2, 616, 5, 5);
}



void drawBottle() {
  if (mousePressed) {
    drawCounter();
    drawFluid(btV, btH, btH+btV);
    drawBottleTop();
    drawBottleShoulder();
    drawBottleTopContainer();
    drawBottleContainer();
    drawBottleBottom();
    // drawControlPoints();
    drawLabel(btV, btH+30, btH+btV);
  }
  else {
    drawCounter();
    drawFluid(0, 0, 160);
    drawBottleTop();
    drawBottleShoulder();
    drawBottleTopContainer();
    drawBottleContainer();
    drawBottleBottom();
    // drawControlPoints();
    drawLabel(0, 0, 255);
  }
}


void draw() {


  if (mousePressed) {
    background(255);

    btV = map(mouseX, 0, width, 35, 120);
    btH = map(mouseY, 0, height, 80, 130);
    drawBottle();
  }
  else {
    int currentSecond = second();
    if (currentSecond != lastSecond) {
      background(255);
      btV = random(35, 120);
      btH = random(80, 130);
      drawBottle();
      lastSecond = currentSecond;
    }
  }
}



