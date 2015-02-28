
int valColor = 0;
float xPos;
color blu = color(10, 32, 141);
color yllw = color(241, 242, 16);
color upprRed = color(126, 6, 15);
color lwrRed = color(156, 15, 6);
color wht = color(254, 254, 254);
float scl = 1.0;
int wide = int(522*scl);
int high = int(400*scl);

void setup() {
  //change this vv to size(wide, high) to scale image by changing scl
  size(522, 400);
  background(wht);
  smooth();
  drawBlueDots();
  drawSun();
  addWhiteStrip();
  drawRedDots();
  drawWhite();
  drawBlueHills();
  drawRedHills();
}

void draw() {
  background(wht);
  drawBlueDots();
  drawSun();
  addWhiteStrip();
  drawRedDots();
  drawWhite();
  drawBlueHills();
  drawRedHills();
}

void drawBlueDots() {
  for (int i = 0; i < 522*scl; i++) {
    fill(blu);
    noStroke();
    pushMatrix();
    ellipse(6*scl, 50*scl, 4*scl, 4*scl);
    for (int j = 0; j < 400*scl; j++) {
      fill(blu);
      noStroke();
      ellipse((6*scl)*i, (50*scl) + (6*scl)*j, 4*scl, 4*scl);
    }
    translate(6*scl, 0);
    popMatrix();
  }
}

void drawRedDots() {
  for (int i = 0; i < 522*scl; i++) {
    fill(upprRed);
    noStroke();
    pushMatrix();
    ellipse(6*scl, 0, 4*scl, 4*scl);
    for (int j = 0; j < 7; j++) {
      fill(upprRed);
      noStroke();
      ellipse((6*scl)*i, (6*scl)*j, 4*scl, 4*scl);
    }
    translate(6*scl, 0);
    popMatrix();
  }
}

void addWhiteStrip() {
  noStroke();
  fill(255);
  rect(0, 0, 522*scl, 50*scl);
}

void drawWhite() {
  fill(wht);
  stroke(blu);
  strokeWeight(4*scl);
  beginShape();
  curveVertex(-10*scl, 32*scl);
  curveVertex(-5*scl, 32*scl);
  curveVertex(60*scl, 46*scl);
  curveVertex(120*scl, 42*scl);
  curveVertex(180*scl, 47*scl);
  curveVertex(260*scl, 40*scl);
  curveVertex(320*scl, 46*scl);
  curveVertex(380*scl, 34*scl);
  curveVertex(440*scl, 44*scl);
  curveVertex(510*scl, 42*scl);
  curveVertex(520*scl, 44*scl);
  curveVertex(540*scl, 58*scl);
  curveVertex(500*scl, 55*scl);
  curveVertex(380*scl, 70*scl);
  curveVertex(340*scl, 62*scl);
  curveVertex(320*scl, 64*scl);
  curveVertex(300*scl, 62*scl);
  curveVertex(270*scl, 64*scl);
  curveVertex(230*scl, 58*scl);
  curveVertex(150*scl, 62*scl);
  curveVertex(50*scl, 60*scl);
  curveVertex(-5*scl, 62*scl);
  curveVertex(-20*scl, 68*scl);
  endShape(CLOSE);
  fill(wht);
  noStroke();
  beginShape();
  curveVertex(-10*scl, 32*scl);
  curveVertex(-5*scl, 32*scl);
  curveVertex(60*scl, 38*scl);
  curveVertex(120*scl, 32*scl);
  curveVertex(180*scl, 37*scl);
  curveVertex(260*scl, 30*scl);
  curveVertex(320*scl, 36*scl);
  curveVertex(380*scl, 24*scl);
  curveVertex(440*scl, 34*scl);
  curveVertex(510*scl, 32*scl);
  curveVertex(540*scl, 50*scl);
  curveVertex(500*scl, 45*scl);
  curveVertex(380*scl, 60*scl);
  curveVertex(340*scl, 52*scl);
  curveVertex(320*scl, 54*scl);
  curveVertex(300*scl, 52*scl);
  curveVertex(270*scl, 54*scl);
  curveVertex(230*scl, 48*scl);
  curveVertex(150*scl, 52*scl);
  curveVertex(50*scl, 50*scl);
  curveVertex(-5*scl, 52*scl);
  curveVertex(-20*scl, 58*scl);
  endShape(CLOSE);
}

void drawSun() {
  if (xPos > 60*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(189), radians(196));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(190), radians(195));
  }
  if (xPos > 120*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(209), radians(220));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(210), radians(219));
  }
  if (xPos > 180*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(235), radians(241));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(236), radians(240));
  }
  if (xPos > 240*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(254), radians(261));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(255), radians(260));
  }
  if (xPos > 300*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(271), radians(279));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(272), radians(278));
  }
  if (xPos > 360*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(294), radians(306));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(295), radians(305));
  }
  if (xPos > 420*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(321), radians(328));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(322), radians(327));
  }
  if (xPos > 480*scl) {
    noStroke();
    fill(blu);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(336), radians(345));
    noStroke();
    fill(yllw);
    arc(width/2, 340*scl, 3000*scl, 3000*scl, radians(337), radians(344));
    stroke(blu);
    strokeWeight(3*scl);
    fill(255);
    ellipse(width/2, 340*scl, 80*scl, 80*scl);
  }
}

void drawBlueHills() {
  fill(blu);
  noStroke();
  beginShape();
  curveVertex(-10*scl, 340*scl);
  curveVertex(0, 340*scl);
  curveVertex(140*scl, 342*scl);
  curveVertex(190*scl, 344*scl);
  curveVertex(220*scl, 334*scl);
  curveVertex(280*scl, 350*scl);
  curveVertex(440*scl, 320*scl);
  curveVertex(522*scl, 335*scl);
  curveVertex(530*scl, 350*scl);
  curveVertex(530*scl, 400*scl);
  curveVertex(-10*scl, 400*scl);
  curveVertex(-10*scl, 400*scl);
  endShape(CLOSE);
}

void drawRedHills() {
  fill(lwrRed);
  noStroke();
  beginShape();
  curveVertex(530*scl, 355*scl);
  curveVertex(522*scl, 340*scl);
  curveVertex(440*scl, 325*scl);
  curveVertex(320*scl, 355*scl);
  curveVertex(360*scl, 365*scl);
  curveVertex(420*scl, 358*scl);
  curveVertex(522*scl, 385*scl);
  curveVertex(530*scl, 405*scl);
  endShape(CLOSE);
  beginShape();
  curveVertex(-5*scl, 335*scl);
  curveVertex(0*scl, 345*scl);
  curveVertex(50*scl, 355*scl);
  curveVertex(120*scl, 348*scl);
  curveVertex(160*scl, 350*scl);
  curveVertex(190*scl, 346*scl);
  curveVertex(210*scl, 348*scl);
  curveVertex(190*scl, 365*scl);
  curveVertex(160*scl, 365*scl);
  curveVertex(50*scl, 380*scl);
  curveVertex(0*scl, 375*scl);
  curveVertex(-5*scl, 370*scl);
  endShape(CLOSE);
  beginShape();
  curveVertex(-5*scl, 395*scl);
  curveVertex(0*scl, 390*scl);
  curveVertex(20*scl, 386*scl);
  curveVertex(60*scl, 388*scl);
  curveVertex(120*scl, 380*scl);
  curveVertex(170*scl, 400*scl);
  curveVertex(140*scl, 420*scl);
  curveVertex(0*scl, 420*scl);
  curveVertex(-10*scl, 420*scl);
  endShape(CLOSE);
  beginShape();
  curveVertex(120*scl, 375*scl);
  curveVertex(130*scl, 375*scl);
  curveVertex(170*scl, 375*scl);
  curveVertex(220*scl, 360*scl);
  curveVertex(260*scl, 362*scl);
  curveVertex(300*scl, 360*scl);
  curveVertex(380*scl, 375*scl);
  curveVertex(440*scl, 372*scl);
  curveVertex(522*scl, 394*scl);
  curveVertex(530*scl, 410*scl);
  curveVertex(340*scl, 400*scl);
  curveVertex(275*scl, 390*scl);
  curveVertex(220*scl, 405*scl);
  curveVertex(130*scl, 375*scl);
  curveVertex(120*scl, 375*scl);
  endShape(CLOSE);
}

void mouseMoved() {
  xPos = mouseX;
}

void mousePressed() {
  valColor = (valColor + 1)%4;
  if (valColor==0) {
    blu = color(10, 32, 141);
    yllw = color(241, 242, 16);
    upprRed = color(126, 6, 15);
    lwrRed = color(156, 15, 6);
    wht = color(254, 254, 254);
  }
  if (valColor==1) {
    blu = color(7, 216, 204);
    yllw = color(27, 247, 25);
    upprRed = color(214, 22, 92);
    lwrRed = color(185, 6, 72);
    wht = color(254, 254, 254);
  }
  if (valColor==2) {
    blu = color(30, 124, 245);
    yllw = color(245, 22, 119);
    upprRed = color(45, 242, 32);
    lwrRed = color(42, 196, 32);
    wht = color(254, 254, 254);
  }
  if (valColor==3) {
    blu = color(227, 9, 147);
    yllw = color(7, 214, 240);
    upprRed = color(72, 250, 33);
    lwrRed = color(92, 255, 57);
    wht = color(254, 254, 254);
  }
}

