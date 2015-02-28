
//MONSTER FACE 2.0
//by Luo
//my code is ugly don't look at it
int faceWidth = 250;
int faceHeight = 300;
int mleftX = 175;
int mleftY = 310;
int mrightX = 325;
int mrightY = 310;
int mouthY = 275;
boolean light = true;
PFont msg;

void setup() {
  msg = createFont("Arial", 12);
  size(500, 500);
  smooth();
}

void draw() { 
  noStroke();

  if (light) {
    background(255, 205, 70);
    fill(0, 30, 150);
    float earY = constrain(mouseY, 250, 450);
    float eX = map(mouseX, 0, width, 150, 135);
    float e2X = map(mouseX, 0, width, 340, 365);
    //left ear
    beginShape();
    vertex(eX, 200); 
    bezierVertex(100, 250, eX-50, earY, eX, 270);
    endShape();
    //right ear
    beginShape();
    vertex(e2X, 200); 
    bezierVertex(400, 250, 550-eX, earY, e2X, 270);
    endShape();
    fill(205, 94, 102);

    //neck
    float nY = map(mouseY, 0, height, 10, 0);
    for (int i = 0; i < 170; i+=10) {
      fill(70, i, i*2);
      ellipse(250, 510- nY-i, 100, 20);
    }

    //face
    fill(100, 135, 220);
    float fx = map(mouseX, 0, width, 220, faceWidth);
    float fy = map(height - mouseY/2, 0, height, 250, faceHeight);
    ellipse(250, 255, fx, fy);

    //mouth
    fill(170, 30, 120);
    beginShape();
    float newmLeftX = map(mouseX, 0, width, mleftX + 50, mleftX);
    float newmRightX = map(mouseX, 0, width, mrightX - 50, mrightX);
    float newmLeftY = map(mouseX, 0, width, mleftY, mleftY + 20);
    vertex(newmLeftX, 300);
    bezierVertex(newmLeftX, 375, newmRightX, 375, newmRightX, 300);
    vertex(newmRightX, 300);
    bezierVertex(newmRightX, newmLeftY, newmLeftX, newmLeftY, newmLeftX, 300);
    endShape();
    fill(255, 255, 255);

    //eye
    stroke(0);
    strokeWeight(1);
    fill(255, 255, 255);
    float eyeballY = map(mouseY, 0, height, 200, 210);
    ellipse(250, eyeballY, 100, 75);
    fill(0, 0, 0);
    //pupil movement
    float eyeX = 250;
    float eyeY = 210;
    float dx = constrain((mouseX-eyeX)/20, -5, 5);
    float dy = constrain((mouseY-eyeY)/20, -6, 6);
    ellipse(eyeX + dx, eyeY + dy, 25, 55);
    fill(255, 255, 255);
    ellipse(eyeX + dx + 5, eyeY + dy - 10, 10, 10);

    fill(0);
    textFont(msg, 14);
    text("Don't click this", 400, 420);
  }
  else {
    drawEvil();
  }
  //horn
  noFill();
  float hY = map(mouseY, 0, height, 0, 10);
  for (int i = 30; i < 105; i++) {
    color c1, c2;
    if (!light) {
      c1 = color(100, 0, 0);
      c2 = color(250, 0, 00);
    }
    else {
      c1 = color(100, 0, 150);
      c2 = color(100, 0, 250);
    }
    float inter = map(i, 30, 105, 0, 10);
    color c = lerpColor(c1, c2, inter);
    stroke(c);
    strokeWeight(4);
    strokeCap(SQUARE);
    arc(250, hY + i, i-30, i-30, PI/4, 3*PI/4);
  }

  //laser is here so it can be drawn over the horn
  if (!light) {
    //LASER 
    strokeWeight(4);
    for (float i = 0; i < 2*PI; i+=(PI/50)) {
      stroke(random(150, 250), random(100, 130), 0);
      line(250, 30, 250 + 100*cos(i), 30 + 100*sin(i));
    }
  }

  //blush
  noStroke();
  if (!light) fill(250, 0, 0);
  else fill(72, 235, 40);
  float blushX = map(mouseX, 0, width, 180, 155);
  float blush2X = map(mouseX, 0, width, 320, 345);
  ellipse(blushX, 260, 50, 50);
  ellipse(blush2X, 260, 50, 50);
  if (!light) fill(0, 0, 0);
  else fill(12, 150, 89);
  ellipse(blushX, 260, 30, 30);
  ellipse(blush2X, 260, 30, 30);

  //nostrils
  stroke(0);
  strokeWeight(2);
  float rnoseX = map(mouseX, 0, width, 230, 220);
  float lnoseX = map(mouseX, 0, width, 270, 280);
  line(rnoseX, 275, rnoseX + 15, 290);
  line(lnoseX, 275, lnoseX - 15, 290);

  drawSwitch();
}

void drawEvil() {
  background(0, 0, 0);
  fill(150, 30, 0);
  float eX = map(mouseX, 0, width, 170, 155);
  float e2X = map(mouseX, 0, width, 330, 345);
  //left horn;
  beginShape();
  vertex(eX, 190); 
  bezierVertex(eX - 50, 170, eX - 50, 70, eX, 50);
  vertex(eX, 50);
  bezierVertex(eX - 30, 70, eX - 30, 190, eX + 50, 130);
  endShape();
  //right horn
  beginShape();
  vertex(e2X, 190); 
  bezierVertex(e2X + 50, 170, e2X + 50, 70, e2X, 50);
  vertex(e2X, 50);
  bezierVertex(e2X + 30, 70, e2X + 30, 190, e2X - 50, 130);
  endShape();
  fill(205, 94, 102);

  //neck
  float nY = map(mouseY, 0, height, 10, 0);
  for (int i = 0; i < 170; i+=10) {
    fill(i*3, i, 50);
    ellipse(250, 510- nY-i, 100, 20);
  }

  //face
  fill(random(130, 180), 80, 80);
  float fx = map(mouseX, 0, width, 220, faceWidth);
  float fy = map(height - mouseY/2, 0, height, 250, faceHeight);
  ellipse(250, 255, fx, fy);

  //mouth
  fill(200, 0, 0);
  beginShape();
  float newmLeftX = map(mouseX, 0, width, mleftX + 10, mleftX);
  float newmRightX = map(mouseX, 0, width, mrightX - 10, mrightX);
  float newmLeftY = map(mouseX, 0, width, mleftY, mleftY + 20);
  vertex(newmLeftX, mouthY);
  bezierVertex(newmLeftX, 370, newmRightX, 370, newmRightX, mouthY);
  vertex(newmRightX, mouthY);
  bezierVertex(newmRightX, newmLeftY + 3, newmLeftX, newmLeftY + 3, newmLeftX, mouthY);
  endShape();
  endShape();

  //eye
  stroke(0);
  strokeWeight(1);
  fill(255, 255, 0);
  float eyeballY = map(mouseY, 0, height, 200, 210);
  ellipse(250, eyeballY, 100, 75);
  fill(200, 0, 0);
  //pupil movement
  float eyeX = 250;
  float eyeY = 210;
  float dx = constrain((mouseX-eyeX)/20, -5, 5);
  float dy = constrain((mouseY-eyeY)/20, -6, 6);
  ellipse(eyeX + dx, eyeY + dy, 15, 55);
  fill(255, 255, 255);
  noStroke();
  ellipse(eyeX + dx + 5, eyeY + dy - 10, 4, 10);

  fill(255);
  textFont(msg, 14);
  text("I TOLD YOU SO!!1", 380, 420);
}

void mouseClicked() {
  if (mouseX > 430 && mouseX < 465 && 
    mouseY > 430 && mouseY < 465) 
    light = !light; 
}

void drawSwitch() {
  noStroke();

  if (!light) {
    fill(180, 180, 180);
  }
  else fill(180, 180, 180);
  rect(430, 430, 35, 35);
  if (!light) {
    fill(255, 0, 0);
  }
  else fill(255, 255, 0);
  rect(440, 440, 15, 15);
}


