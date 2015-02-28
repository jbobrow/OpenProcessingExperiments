
int disperse1 = 0;
int disperse2 = 0;
int bREDx =20; 
int bREDy =20;
int bBLUEx = 20;
int bBLUEy = 40;
int bGREENx = 20;
int bGREENy = 60;
int insideRED = -1;
int insideBLUE = -1;
int insideGREEN = -1;
int bPURPLEx = 20;
int bPURPLEy = 80;
int insidePURPLE = -1;
int bYELLOWx = 20;
int bYELLOWy = 100;
int insideYELLOW = -1;

void setup() {
  size(900, 700);
  smooth();
  background(255);
}

void draw() {
  frameRate(100);
  //button icons
  fill(255, 0, 0);
  rect(bREDx, bREDy, 60, 15);//red button
  fill(0, 0, 255);
  rect(bBLUEx, bBLUEy, 60, 15);//blue button
  fill(0, 255, 0);
  rect(bGREENx, bGREENy, 60, 15);//green button
  fill(255, 0, 255);
  rect(bPURPLEx, bPURPLEy, 60, 15);//purple button
  fill(255, 255, 0);
  rect(bYELLOWx, bYELLOWy, 60, 15);//yellow






  float rSize = random(-30, 30);//arc size
  float r2 = random(0, 255);
  float r3 = random(0, 255);
  float r4 = random(0, 255);
  int R1 =  int(random(100, 255));//high colors
  float yellow = random(0,100);//special yellow



  fill(r2, r3, r4);
  strokeWeight(0);
  //fills for circles related to buttons pressed
  if (insideRED==1) 
  {
    fill(R1, 0, 0);
  }
  if (insideBLUE==1) {
    fill(0, 0, R1);
  }
  if (insideGREEN==1) {
    fill(0, R1, 0);
  }
  if (insidePURPLE==1) {
    fill(R1, 0, R1);
  }
  if (insideYELLOW==1) {
    fill(255, 255, yellow);
  }



  //triggers for flashing

  if (insideRED==1) {
    rect(bREDx, bREDy, 60, 15);
  }
  if (insideBLUE==1) {
    rect(bBLUEx, bBLUEy, 60, 15);
  }
  if (insideGREEN==1) {
    rect(bGREENx, bGREENy, 60, 15);
  }
  if (insidePURPLE==1) {
    rect(bPURPLEx, bPURPLEy, 60, 15);
  }
  if (insideYELLOW==1) {
    rect(bYELLOWx, bYELLOWy, 60, 15);
  }

  if (keyPressed && key==' ') {
    background(255);
  }





  //mouse pressed
  if (mousePressed==true && mouseButton == LEFT) {

    arc(mouseX, mouseY, rSize, rSize, 0, 2*PI);
  }
  if (mousePressed==true && mouseButton == RIGHT) {

    disperse1 = int(random(-40, 40));
    disperse2 = int(random(-40, 40));
    disperse1 = disperse1 +30;
    disperse2 = disperse2 +30;

    arc(mouseX+disperse1, mouseY+disperse2, rSize, rSize, 0, 2*PI);
  }
}


void mousePressed() {
  if (!(((mouseX > ( bREDx+60))||(mouseY > (bREDy+15)))||((mouseX < bREDx)||(mouseY < bREDy))))
  {
    insideRED=insideRED*-1;
    insideBLUE = -1;
    insideGREEN = -1;
    insidePURPLE = -1;
    insideYELLOW = -1;
  }
  if (!(((mouseX > ( bBLUEx+60))||(mouseY > (bBLUEy+15)))||((mouseX < bBLUEx)||(mouseY < bBLUEy))))
  {
    insideBLUE=insideBLUE*-1;
    insideRED=-1;
    insideGREEN = -1;
    insidePURPLE=-1;
    insideYELLOW=-1;
  }
  if (!(((mouseX > ( bGREENx+60))||(mouseY > (bGREENy+15)))||((mouseX < bGREENx)||(mouseY < bGREENy))))
  {
    insideGREEN=insideGREEN*-1;
    insideRED=-1;
    insideBLUE=-1;
    insidePURPLE=-1;
    insideYELLOW=-1;
  }
  if (!(((mouseX > ( bPURPLEx+60))||(mouseY > (bPURPLEy+15)))||((mouseX < bPURPLEx)||(mouseY < bPURPLEy))))
  {
    insidePURPLE=insidePURPLE*-1;
    insideRED=-1;
    insideBLUE=-1;
    insideGREEN=-1;
    insideYELLOW =-1;
  }
  if (!(((mouseX > ( bYELLOWx+60))||(mouseY > (bYELLOWy+15)))||((mouseX < bYELLOWx)||(mouseY < bYELLOWy))))
  {
    insideYELLOW=insideYELLOW=1;
    insideRED=-1;
    insideBLUE=-1;
    insideGREEN=-1;
    insidePURPLE=-1;
  }
}


