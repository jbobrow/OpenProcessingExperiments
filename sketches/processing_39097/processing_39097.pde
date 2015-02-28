
PImage bubbleGum;

int millisWhenClicked;
int duration;
boolean isActive;

float bubbleWidth;
float bubbleHeight;

float eyeWidth;
float eyeHeight;

void setup() {
  size(400, 400);
  bubbleGum = loadImage("bubbleGum1.png");
  duration = 5000;
  isActive = false;
  initialize();
}

void draw() {
  updateTimer();
  drawAnimation();
}

void initialize() {
  bubbleWidth = 12;
  bubbleHeight = 12;
  eyeWidth = 25;
  eyeHeight = 20;
  millisWhenClicked = millis();
}

void updateTimer() {
  int elapsed = millis()-millisWhenClicked;
  if (elapsed > duration) {
    isActive = false;
  } 
  else {
    isActive = true;
  }
}

void drawAnimation() {
  background(27, 75, 124);

  drawShirt();
  drawHead();
  drawEyes();
  drawNose();
  drawMouth();
  drawBubble();

  if (isActive) {
    blowBubble();
    growEyes();
  }
  else {
    popBubble();
  }
}

void blowBubble() {
  bubbleWidth += 2;
  bubbleHeight += 2;
}

void growEyes() {
  eyeWidth += 0.05;
  eyeHeight += 0.05;
}

void popBubble() {
  bubbleWidth = 0;
  bubbleHeight = 0;
  image(bubbleGum, 0, 0, width, height);
}

void drawShirt() {
  fill(106, 22, 34);
  stroke(147, 31, 47);

  beginShape();
  vertex(width/4, height);
  vertex(width/4, 3*height/4+50);
  bezierVertex(width/4, height/2+50, width/4, height/2+50, 
  width/2, height/2+50);
  vertex(width/2, height/2+50);
  bezierVertex(3*width/4, height/2+50, 3*width/4, height/2+50, 
  3*width/4, 3*height/4+50);
  vertex(3*width/4, height);
  endShape(CLOSE);
}

void drawHead() {

  //draw cap brim
  fill(51, 46, 100);
  stroke(76, 67, 165);
  beginShape();
  vertex(width/2-60, height/2-25);
  bezierVertex(width/2-90, height/2+25, width/2-90, 
  height/2+25, width/2, height/2+25);
  vertex(width/2, height/2+25);
  bezierVertex(width/2+90, height/2+25, width/2+90, 
  height/2+25, width/2+60, height/2-25);
  vertex(width/2+60, height/2-25);
  endShape(CLOSE);

  //draw face
  fill(240, 189, 148);
  noStroke();
  ellipse(width/2, height/2, 130, 130);

  //draw hat
  fill(31, 23, 106);
  stroke(255);
  arc(width/2, height/2-20, 125, 110, PI, TWO_PI);

  //draw hat tip
  fill(255);
  stroke(255);
  ellipse(width/2, height/2-75, 20, 10);

  //draw hat stripes
  noFill();
  stroke(255);
  for (int i=-2; i<3; i++) {
    bezier(width/2, height/2-75, width/2-8*i, height/2-65, 
    width/2-16*i, height/2-65, width/2-24*i, height/2-20);
  }
}

void drawEyes() {

  //draw eyeballs
  fill(255);
  noStroke();
  ellipse(width/2-25, height/2, eyeWidth, eyeHeight);
  ellipse(width/2+25, height/2, eyeWidth, eyeHeight);

  //draw irises
  fill(81, 111, 30);
  noStroke();
  ellipse(width/2-25, height/2, eyeWidth-10, eyeHeight-5);
  ellipse(width/2+25, height/2, eyeWidth-10, eyeHeight-5);  

  //draw pupils
  fill(0);
  noStroke();
  ellipse(width/2-25, height/2, eyeWidth/5, eyeHeight/4);
  ellipse(width/2+25, height/2, eyeWidth/5, eyeHeight/4);
}

void drawNose() {
  noFill();
  stroke(0);
  line(width/2-5, height/2+20, width/2-10, height/2+18);
  line(width/2+5, height/2+20, width/2+10, height/2+18);
}

void drawMouth() {

  //draw lips
  fill(183, 48, 15);
  noStroke();
  ellipse(width/2, height/2+40, 20, 20);

  //draw mouth opening
  fill(0);
  noStroke();
  ellipse(width/2, height/2+40, 16, 12);
}

void drawBubble() {
  fill(247, 35, 127, 230);
  noStroke();
  ellipse(width/2, height/2+40, bubbleWidth, bubbleHeight);
}

void mousePressed() {
  initialize();
}


