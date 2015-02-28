
// generator

int i;

//declare colors
color rd;
color dkrd;
color blu;
color dkblu;
color grn;
color blk;
color gry;
color ylw;
color bwn;
color prp;

void setup() {
  //  saveFrame();
  size(600, 600);
  background(222, 219, 159);
  //define colors
  rd = color(202, 0, 0, 128);
  dkrd = color(255, 0, 0);
  grn = color(0, 255, 0);
  blu = color(53, 109, 203, 180);
  dkblu = color(50, 48, 178, 128);
  blk = color(0, 0, 0);
  gry = color(201);
  ylw = color(241, 250, 0, 130);
  bwn = color(82, 81, 47, 128);
  prp = color(147, 12, 149);
  smooth();
}

void mouseClicked() {
  i++;
}

//draw Pollack
void drawPollack() {
  fill(prp);
  noStroke();
  ellipseMode(CENTER);
  ellipse(300, 300, 10, 10);
  fill(blk);
  noStroke();
  ellipseMode(CENTER);
  ellipse(280, 280, 15, 15);
  fill(ylw);
  noStroke();
  ellipseMode(CENTER);
  fill(dkrd);
  noStroke();
  ellipseMode(CENTER);
  ellipse(400, 400, 20, 20);
  fill(dkblu);
  noStroke();
  ellipseMode(CENTER);
  ellipse(390, 500, 10, 10);
}

void drawMoreLines() {
  noFill();
  stroke(blk);
  strokeWeight(1);
  arc(100, 100, 125, 125, PI/2, PI);
  noFill();
  stroke(blk);
  strokeWeight(3);
  arc(130, 100, 170, 125, PI/2, PI);
  noFill();
  stroke(blk);
  strokeWeight(5);
  arc(170, 100, 205, 125, PI/2, PI);
}

void drawYellowRedCircles() {
  fill(ylw);
  stroke(blk);
  strokeWeight(2);
  ellipseMode(CENTER);
  ellipse(100, 400, 100, 100);
  fill(ylw);
  stroke(blk);
  strokeWeight(1);
  ellipseMode(CENTER);
  ellipse(280, 380, 80, 80);
  fill(blk);
  stroke(blk);
  ellipseMode(CENTER);
  ellipse(280, 380, 25, 25);
  fill(dkrd);
  noStroke();
  ellipseMode(CENTER);
  ellipse(230, 550, 30, 30);
  fill(rd);
  noStroke();
  ellipseMode(CENTER);
  ellipse(230, 550, 15, 15);
}

//draw red triangle
void drawRedTriangle() {
  stroke(rd);
  fill(rd);
  triangle(56, 117, 169, 63, 226, 124);
}

//draw black triangle
void drawBlackTriangle() {
  stroke(blk);
  fill(blk);
  triangle(0, 0, 30, 30, 90, 0);
}

//draw brown triangle
void drawBrownTriangle() {
  noStroke();
  fill(bwn);
  triangle(0, 0, 0, 90, 100, 0);
}

//draw black dot
void drawBlackDot() {
  fill(blk);
  ellipseMode(CENTER);
  ellipse(0, 0, 15, 15);
}

//draw red dot
void drawRedDot() {
  stroke(blk);
  strokeWeight(3);
  fill(rd);
  ellipseMode(CENTER);
  ellipse(0, 0, 30, 30);
}

//draw yellow dot
void drawYellowDot() {
  noStroke();
  fill(ylw);
  ellipseMode(CENTER);
  ellipse(0, 0, 50, 50);
}

//draw blue dot
void drawBlueDot() {
  stroke(blk);
  strokeWeight(1);
  fill(dkblu);
  ellipseMode(CENTER);
  ellipse(0, 0, 40, 40);
}

//draw arc
void drawRedArc() {
  stroke(dkrd);
  strokeWeight(3);
  noFill();
  arc(50, 50, 200, 200, TWO_PI-PI/2, TWO_PI);
}

//draw blu circle
void drawBlueCircle() {
  stroke(blk);
  strokeWeight(1);
  fill(blu);
  ellipseMode(CENTER);
  ellipse(width/2, height/2, 80, 80);
}


//draw yellow circle
void drawYellowCircle() {
  stroke(blk);
  strokeWeight(4);
  fill(ylw);
  ellipseMode(CENTER);
  ellipse(100, 100, 20, 20);
}

void drawThreeLines() {
  stroke(blk);
  strokeWeight(8);
  line(100, 560, 580, 50);
  stroke(blk);
  strokeWeight(3);
  line(190, 340, 250, 280);
  stroke(dkrd);
  strokeWeight(3);
  line(160, 130, 240, 100);
}

void drawBlueShape() {
  stroke(blk);
  strokeWeight(1);
  fill(dkblu);
  beginShape();
  vertex(80, 550);
  vertex(170, 150);
  vertex(190, 250);
  vertex(220, 210);
  vertex(210, 300);
  vertex(290, 340);
  vertex(295, 390);
  endShape(CLOSE);
}

void drawRidge() {
  noStroke();
  fill(prp);
  beginShape();
  vertex(80, 175);
  vertex(95, 155);
  vertex(105, 165);
  vertex(108, 160);
  vertex(120, 170);
  vertex(123, 166);
  vertex(140, 175);
  endShape(CLOSE);
}

void draw () {
  if (i == 1) {
    drawBlueCircle();
  }
  if (i == 2) {
    drawYellowCircle();
  }
  if (i == 3) {
    drawThreeLines();
  }
  if (i == 3) {
    drawPollack();
  }
  if (i == 4) {
    drawYellowRedCircles();
  }
  if (i == 5) {
    drawMoreLines();
  } 
  if (i == 6) {
    drawRidge();
  }
  if (i == 7) {
    drawBlueShape();
  }
  if (i == 8) {
    pushMatrix();
    translate(50, 50);
    drawRedTriangle();
    popMatrix();
  }
  if (i == 9) {
    pushMatrix();
    translate(380, 180);
    drawRedArc();
    popMatrix();
  }

  if (i == 10) {
    pushMatrix();
    translate(250, 90);
    drawYellowDot();
    popMatrix();

    pushMatrix();
    translate(350, 400);
    drawRedDot();
    popMatrix();

    pushMatrix();
    translate(525, height/2);
    drawBlueDot();
    popMatrix();

    pushMatrix();
    translate(width/2, height/3);
    drawBlackDot();
    popMatrix();
  }

  if (i == 11) {
     pushMatrix();
    translate(300, 400);
    drawBrownTriangle();
    popMatrix();

    pushMatrix();
    translate(320, 430);
    drawBlackTriangle();
    popMatrix();
    
//    saveFrame();
  }

  if (i == 12) {
    background(222, 219, 159);
    i = 0;
  }
}


