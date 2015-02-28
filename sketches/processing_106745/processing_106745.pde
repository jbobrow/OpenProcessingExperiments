
float rotateAmountPurpleTriangle;
float rotateAmountOrangeTriangle;
float rotateAmountYellowTriangle;
float rotateAmountPinkTriangle;
float rotateAmountPurpleCircle;
float rotateAmountOrangeCircle;
float rotateAmountYellowCircle;
float rotateAmountPinkCircle;
float rotateAmountPurpleSquare;
float rotateAmountOrangeSquare;
float rotateAmountYellowSquare;
float rotateAmountPinkSquare;
boolean purpleTriangleButton;
boolean orangeTriangleButton;
boolean yellowTriangleButton;
boolean pinkTriangleButton;
boolean purpleSquareButton;
boolean orangeSquareButton;
boolean yellowSquareButton;
boolean pinkSquareButton;
boolean purpleCircleButton;
boolean orangeCircleButton;
boolean yellowCircleButton;
boolean pinkCircleButton;



void setup () {
  size (800, 600);
  ellipseMode(CENTER);

  purpleTriangleButton=false;
  orangeTriangleButton=false;
  yellowTriangleButton=false;
  pinkTriangleButton=false;
  purpleSquareButton=false;
  orangeSquareButton=false;
  yellowSquareButton=false;
  pinkSquareButton=false;
  purpleCircleButton=false;
  orangeCircleButton=false;
  yellowCircleButton=false;
  pinkCircleButton=false;
}

void draw () {
  background (166, 233, 255);

  //grass
  for (int i=0; i<799; i++) {
    stroke(69, 189, 71);
    strokeWeight (1);
    line(2*i+1, 560, 2*i+1, 600);
  }
  //flower stem
  stroke(69, 189, 71);
  strokeWeight (4);
  line(400, 450, 400, 600);

  //clouds
  noStroke();
  fill(255);
  ellipse(90, 80, 110, 90);
  ellipse(120, 55, 70, 70);
  ellipse(140, 80, 80, 80);
  ellipse(160, 70, 60, 60);

  ellipse(700, 170, 90, 80);
  ellipse(650, 180, 80, 80);
  ellipse(670, 140, 60, 60);

  //triangles
  noStroke();
  fill(129, 13, 224);
  triangle(220, 60, 220, 120, 280, 120);
  fill(247, 107, 9);
  triangle(320, 60, 320, 120, 380, 120);
  fill(232, 213, 12);
  triangle(420, 60, 420, 120, 480, 120);
  fill(224, 17, 108);
  triangle(520, 60, 520, 120, 580, 120);


  //circles
  fill(129, 13, 224);
  ellipse(250, 160, 60, 60);
  fill(247, 107, 9);
  ellipse(350, 160, 60, 60);
  fill(232, 213, 12);
  ellipse(450, 160, 60, 60);
  fill(224, 17, 108);
  ellipse(550, 160, 60, 60);

  //squares
  fill(129, 13, 224);
  rect(220, 200, 60, 60);
  fill(247, 107, 9);
  rect(320, 200, 60, 60);
  fill(232, 213, 12);
  rect(420, 200, 60, 60);
  fill(224, 17, 108);
  rect(520, 200, 60, 60);

  drawPurpleTriangle();
  drawOrangeTriangle();
  drawYellowTriangle();
  drawPinkTriangle();

  drawPurpleCircle();
  drawOrangeCircle();
  drawYellowCircle();
  drawPinkCircle();

  drawPurpleSquare();
  drawOrangeSquare();
  drawYellowSquare();
  drawPinkSquare();
}


void drawPurpleTriangle() {
  if (purpleTriangleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountPurpleTriangle);
    fill(129, 13, 224, 100);
    triangle(30, 0, 90, 0, 90, -60);
    triangle(0, -30, 0, -90, -60, -90);
    triangle(-30, 0, -90, 0, -90, 60);
    triangle(0, 30, 0, 90, 60, 90);
    rotateAmountPurpleTriangle = rotateAmountPurpleTriangle - 0.07;
    popMatrix();
  }
  else {
  }
}

void drawOrangeTriangle() {
  if (orangeTriangleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountOrangeTriangle);
    fill(247, 107, 9, 120);
    triangle(5, 0, 25, 0, 25, -20);
    triangle(0, -5, 0, -25, -20, -25);
    triangle(-5, 0, -25, 0, -25, 20);
    triangle(0, 5, 0, 25, 20, 25);
    rotateAmountOrangeTriangle = rotateAmountOrangeTriangle + 0.1;
    popMatrix();
  }
  else {
  }
}

void drawYellowTriangle() {
  if (yellowTriangleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountYellowTriangle);
    fill(232, 213, 12, 150);
    triangle(0, 10, 100, 110, 0, 110);
    triangle(10, 0, 110, 0, 110, -100);
    triangle(0, -10, 0, -110, -100, -110);
    triangle(-10, 0, -110, 0, -110, 100);
    rotateAmountYellowTriangle = rotateAmountYellowTriangle - 0.08;
    popMatrix();
  }
  else {
  }
}

void drawPinkTriangle() {
  if (pinkTriangleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountPinkTriangle);
    fill(224, 17, 108, 130);
    triangle(20, 0, 80, 0, 80, -60);
    triangle(0, -20, 0, -80, -60, -80);
    triangle(-20, 0, -80, 0, -80, 60);
    triangle(0, 20, 0, 80, 60, 80);
    rotateAmountPinkTriangle = rotateAmountPinkTriangle + 0.05;
    popMatrix();
  }
  else {
  }
}


void drawPurpleSquare() {
  if (purpleSquareButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountPurpleSquare);
    fill(129, 13, 224, 150);
    rect(10, -25, 50, 50);
    rect(-25, -60, 50, 50);
    rect(-60, -25, 50, 50);
    rect(-25, 10, 50, 50);
    rotateAmountPurpleSquare = rotateAmountPurpleSquare + 0.1;
    popMatrix();
  } 
  else {
  }
}

void drawOrangeSquare() {
  if (orangeSquareButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountOrangeSquare);
    fill(247, 107, 9, 100);
    rect(20, -30, 50, 50);
    rect(-30, -80, 50, 50);
    rect(-80, -30, 50, 50);
    rect(-30, 20, 50, 50);
    rotateAmountOrangeSquare = rotateAmountOrangeSquare - 0.05;
    popMatrix();
  } 
  else {
  }
}

void drawYellowSquare() {
  if (yellowSquareButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountYellowSquare);
    fill(232, 213, 12, 100);
    rect(50, -20, 50, 50);
    rect(-20, -90, 50, 50);
    rect(-90, -20, 50, 50);
    rect(-20, 50, 50, 50);
    rotateAmountYellowSquare = rotateAmountYellowSquare + 0.05;
    popMatrix();
  } 
  else {
  }
}

void drawPinkSquare() {
  if (pinkSquareButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountPinkSquare);
    fill(224, 17, 108, 150);
    rect(80, -25, 50, 50);
    rect(-25, -130, 50, 50);
    rect(-130, -25, 50, 50);
    rect(-25, 80, 50, 50);
    rotateAmountPinkSquare = rotateAmountPinkSquare - 0.1;
    popMatrix();
  } 
  else {
  }
}

void drawPurpleCircle() {
  if (purpleCircleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountPurpleCircle);
    fill(129, 13, 224, 100);
    ellipse(100, 0, 60, 60);
    ellipse(0, -100, 60, 60);
    ellipse(-100, 0, 60, 60);
    ellipse(0, 100, 60, 60);
    rotateAmountPurpleCircle = rotateAmountPurpleCircle + 0.09;
    popMatrix();
  } 
  else {
  }
}

void drawOrangeCircle() {
  if (orangeCircleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountOrangeCircle);
    fill(247, 107, 9, 200);
    ellipse(130, 0, 80, 80);
    ellipse(0, -130, 80, 80);
    ellipse(-130, 0, 80, 80);
    ellipse(0, 130, 80, 80);
    rotateAmountOrangeCircle = rotateAmountOrangeCircle + 0.13;
    popMatrix();
  } 
  else {
  }
}

void drawYellowCircle() {
  if (yellowCircleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountYellowCircle);
    fill(232, 213, 12, 150);
    ellipse(30, 0, 50, 50);
    ellipse(0, -30, 50, 50);
    ellipse(-30, 0, 50, 50);
    ellipse(0, 30, 50, 50);
    rotateAmountYellowCircle = rotateAmountYellowCircle - 0.06;
    popMatrix();
  } 
  else {
  }
}

void drawPinkCircle() {
  if (pinkCircleButton) {
    pushMatrix();
    translate(400, 400);
    rotate(rotateAmountPinkCircle);
    fill(224, 17, 108, 150);
    ellipse(90, 0, 80, 80);
    ellipse(0, -90, 80, 80);
    ellipse(-90, 0, 80, 80);
    ellipse(0, 90, 80, 80);
    rotateAmountPinkCircle = rotateAmountPinkCircle - 0.06;
    popMatrix();
  } 
  else {
  }
}

void mouseClicked() {
  if (dist(mouseX, mouseY, 240, 95)<50) {
    purpleTriangleButton =! purpleTriangleButton;
  }
  if (dist(mouseX, mouseY, 340, 95)<50) {
    orangeTriangleButton =! orangeTriangleButton;
  }
  if (dist(mouseX, mouseY, 440, 95)<50) {
    yellowTriangleButton =! yellowTriangleButton;
  }
  if (dist(mouseX, mouseY, 540, 95)<50) {
    pinkTriangleButton =! pinkTriangleButton;
  }
  if (mouseX>220 && mouseX<280 && mouseY>200 && mouseY<260) {
    purpleSquareButton =! purpleSquareButton;
  }

  if (mouseX>320 && mouseX<380 && mouseY>200 && mouseY<260) {
    orangeSquareButton =! orangeSquareButton;
  }

  if (mouseX>420 && mouseX<480 && mouseY>200 && mouseY<260) {
    yellowSquareButton =! yellowSquareButton;
  }

  if (mouseX>520 && mouseX<580 && mouseY>200 && mouseY<260) {
    pinkSquareButton =! pinkSquareButton;
  }

  if (dist(mouseX, mouseY, 250, 160)<30) {
    purpleCircleButton =! purpleCircleButton;
  }

  if (dist(mouseX, mouseY, 350, 160)<30) {
    orangeCircleButton =! orangeCircleButton;
  }

  if (dist(mouseX, mouseY, 450, 160)<30) {
    yellowCircleButton =! yellowCircleButton;
  }

  if (dist(mouseX, mouseY, 550, 160)<30) {
    pinkCircleButton =! pinkCircleButton;
  }
}



