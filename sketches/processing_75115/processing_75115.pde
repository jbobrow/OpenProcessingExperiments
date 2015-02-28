
boolean[] circleColor = new boolean[10];
PVector R1C0 = new PVector (100, 60);
PVector R1C1 = new PVector (200, 60);
PVector R1C2 = new PVector (300, 60);
PVector R1C3 = new PVector (400, 60);

PVector R2C4 = new PVector (150, 150);
PVector R2C5 = new PVector (250, 150);
PVector R2C6 = new PVector (350, 150);

PVector R3C7 = new PVector (200, 240);
PVector R3C8 = new PVector (300, 240);

PVector R4C9 = new PVector (250, 330);

void setup() {
  size(500, 500);
  background(255); 
  for (int i = 0; i < 10; i++) {
    if (i%2 == 0) {
      circleColor[i] = true;
    } 
    else {
      circleColor[i] = false;
    }
  }
}

void draw() {
  background(255);
  stroke(154, 210, 89);
  strokeWeight(10);
  line(250, 0, 250, 150);
  
  smooth();
 
  
  noStroke();
  // row 1
  for (int i = 0; i<4; i++) {
    if (circleColor[i] == true) {
      fill(244, 231, 73); // yellowgreen
    } 
    else {
      fill(140, 59, 128); // purple
    }
    ellipse(100 + i*100, 60, 100, 100);
  }

  // row 2
  for (int i = 4; i<7; i++) {
    if (circleColor[i] == true) {
      fill(244, 231, 73); // yellowgreen
    } 
    else {
      fill(140, 59, 128); // purple
    }
    ellipse(100 + (i-3.5)*100, 150, 100, 100);
  }
  //row 3
  for (int i = 7; i<9; i++) {
    if (circleColor[i] == true) {
      fill(244, 231, 73); // yellowgreen
    } else {
      fill(140, 59, 128); // purple
    }
    ellipse(100 + (i-6)*100, 240, 100, 100);
  }
  
  //row 4
  if (circleColor[9] == true){
    fill(244, 231, 73); // yellowgreen
   } else {
      fill(140, 59, 128); // purple
   }
    ellipse(width/2, 330, 100, 100);
    
  drawArrows();
}

void drawArrows(){
  int fontX = 95;
  int fontY = 70;
  fill(255);
  textSize(32);
  text("↓", fontX, fontY);
  text("↓", fontX*2, fontY);
  text("↑", fontX*3.1, fontY);
  text("↑", fontX*4.1, fontY);
  text("⇊", fontX*1.4, fontY*2.3);
  text("⇊", fontX*2.4, fontY*2.3);
  text("⇈", fontX*3.5, fontY*2.3);
  text("⇈", fontX*1.9, fontY*3.5);
  text("⇈", fontX*1.9, fontY*3.5);
  text("↨", fontX*3.1, fontY*3.5);
  text("↨", fontX*2.5, fontY*4.8);
}

void mousePressed() {
    float mX = mouseX;
    float mY = mouseY;
    // row1
    if (inCircle(R1C0.x, R1C0.y, mX, mY)) {
      circleColor[0] = false;
    } 
    else if (inCircle(R1C1.x, R1C1.y, mX, mY)) {
      circleColor[1] = true;
    }
    
    // row 2
    else if (inCircle(R2C4.x, R2C4.y, mX, mY)) {
      circleColor[4] = !circleColor[4];
    }
    else if (inCircle(R2C5.x, R2C5.y, mX, mY)) {
      circleColor[5] = !circleColor[5];
    }
    else if (inCircle(R3C8.x, R3C8.y, mX, mY)) {
      circleColor[8] = !circleColor[8];
    }
    else if (inCircle(R4C9.x, R4C9.y, mX, mY)) {
      circleColor[9] = !circleColor[9];
    }
}

void mouseReleased(){
  float mX = mouseX;
  float mY = mouseY;
  // row 1
  if (inCircle(R1C2.x, R1C2.y, mX, mY)) {
      circleColor[2] = false;
    } 
  else if (inCircle(R1C3.x, R1C3.y, mX, mY)) {
      circleColor[3] = true;
    }
  // row2
  else if (inCircle(R2C6.x, R2C6.y, mX, mY)) {
      circleColor[6] = !circleColor[6];
    }
  else if (inCircle(R3C7.x, R3C7.y, mX, mY)) {
      circleColor[7] = !circleColor[7];
    }
  else if (inCircle(R3C8.x, R3C8.y, mX, mY)) {
      circleColor[8] = !circleColor[8];
    }
  else if (inCircle(R4C9.x, R4C9.y, mX, mY)) {
      circleColor[9] = !circleColor[9];
   }
}


boolean inCircle(float circleX, float circleY, float mX, float mY) {
    float distance = dist(circleX, circleY, mX, mY);
    return (distance <= 50);
  }
