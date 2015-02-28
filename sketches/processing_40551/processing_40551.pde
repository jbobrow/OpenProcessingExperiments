
int step=0;
int stepPlusOne=step+1;
int buttonWidth=200;
int buttonHeight=60;
int buttonXCenter=width/2;
int buttonYCenter=height/2;
PFont f;

void setup() {
  size(500, 600);//Set Size of Drawing
  background(50, 50, 50);//Set Background Color
}
void draw() {
  smooth(); //Set Anti-Aliasing   
  //Begin Head
  noFill();
  stroke(255, 255, 255);
  strokeWeight(3);
  bezier(145, 150, 140, 80, 220, 60, 250, 60);
  bezier(250, 60, 280, 60, 360, 80, 350, 150);
  bezier(145, 150, 146, 165, 147, 175, 152, 190);
  bezier(350, 150, 349, 165, 347, 175, 342, 190);

  //EARS

  bezier(147, 180, 115, 165, 145, 246, 160, 240);
  bezier(347, 180, 380, 165, 350, 246, 335, 240);

  //JAW
  bezier(160, 240, 175, 360, 315, 360, 335, 240);

  //Neck-shoulder Left
  bezier(25, 400, 70, 335, 175, 400, 175, 287);

  //Neck-shoulder Right
  bezier(318, 287, 318, 400, 430, 335, 475, 400);

  // Create Centerlines
  strokeWeight(1);
  line(250, 60, 250, 450);
  line(135, 190, 363, 190);
  line(235, 260, 265, 260);
  line(235, 300, 265, 300);
  //Button to initiate user interaction
  // 
  //    button = !button;
  //    step=step+1;

  rectMode(CENTER);
  fill(255, 0, 0);
  rect(width/2, height/2+250, buttonWidth, buttonHeight);
  //  println(step);
  if (step==0) {
    f = loadFont("SansSerif-20.vlw");
    textFont(f, 20);
    fill(0);
    text("Add Features!", width/2-buttonWidth/3, height/2+260);
  }
  //if Statement for Eyes
  else if (step==1) {
    f = loadFont("SansSerif-20.vlw");
    textFont(f, 20);
    fill(0);
    text("Add Eyes!", width/2-buttonWidth/4, height/2+260);
  }
  //if Statement for mouth
  else if (step==2) {
    f = loadFont("SansSerif-20.vlw");
    textFont(f, 20);
    fill(0);
    text("Add Mouth", width/2-buttonWidth/4, height/2+260);
  }
  else if (step==3) {
    f = loadFont("SansSerif-20.vlw");
    textFont(f, 20);
    fill(0);
    text("Add Nose!", width/2-buttonWidth/4, height/2+260);
  }
}
void mousePressed() {
  if (mousePressed && mouseX > width/2-buttonWidth/2+27 && mouseX < width/2+buttonWidth/2+27 && mouseY >height/2+220  && mouseY < height/2+220+buttonHeight) {
    step=step+1;
    stepPlusOne=stepPlusOne+1;
  }
  //Adding Eyes
  if (mousePressed && stepPlusOne==2) {
    noFill();
    drawEyes();
  }
  //Adding Mouth
  if (mousePressed && stepPlusOne==3) {
    drawMouth();
  }
  //Adding Nose
  if (mousePressed && stepPlusOne==4) {
    drawNose();
  }
}

void drawEyes() {
  //curve(mouseX-66, mouseY+323, mouseY+125, mouseX+102, mouseX+200, mouseY+100, mouseX-44, mouseY+2);
  fill(255);
  int eyeRadius=20;
  int irisRadius=10;
  ellipse(mouseX, mouseY, eyeRadius+15, eyeRadius);
  fill(0);
  ellipse(mouseX, mouseY, irisRadius, irisRadius);
}

void drawMouth() {
  fill(255, 152, 152);
  int mouthRadius=20;
  noStroke();
  ellipse(mouseX-10, mouseY, mouthRadius+20, mouthRadius-5);
  ellipse(mouseX+10, mouseY, mouthRadius+20, mouthRadius-5);
  stroke(0);
  line(mouseX+30, mouseY, mouseX-30, mouseY);
}


void drawNose() {
  strokeWeight(3);
  stroke(0);
  beginShape(); 
    line(mouseX-10, mouseY-10, mouseX-15, mouseY+17);
    line(mouseX+10, mouseY-10, mouseX+15, mouseY+17);
    line(mouseX-15, mouseY+17, mouseX-5, mouseY+20);
    line(mouseX+15, mouseY+17, mouseX-5, mouseY+20);
    endShape();
  }


void drawEyes() {
  //curve(mouseX-66, mouseY+323, mouseY+125, mouseX+102, mouseX+200, mouseY+100, mouseX-44, mouseY+2);
  fill(255);
  int eyeRadius=20;
  int irisRadius=10;
  ellipse(mouseX, mouseY, eyeRadius+15, eyeRadius);
  fill(0);
  ellipse(mouseX, mouseY, irisRadius, irisRadius);
}

void drawMouth() {
  fill(255, 152, 152);
  int mouthRadius=20;
  noStroke();
  ellipse(mouseX-10, mouseY, mouthRadius+20, mouthRadius-5);
  ellipse(mouseX+10, mouseY, mouthRadius+20, mouthRadius-5);
  stroke(0);
  line(mouseX+30, mouseY, mouseX-30, mouseY);
}


void drawNose() {
  strokeWeight(3);
  stroke(0);
  beginShape(); 
    line(mouseX-10, mouseY-10, mouseX-15, mouseY+17);
    line(mouseX+10, mouseY-10, mouseX+15, mouseY+17);
    line(mouseX-15, mouseY+17, mouseX-5, mouseY+20);
    line(mouseX+15, mouseY+17, mouseX-5, mouseY+20);
    endShape();
  }



