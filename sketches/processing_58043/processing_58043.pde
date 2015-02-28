
// Created by Rachel Bacus
// ARCH 2503 Digital Media, Department of Architecture, Cornell AAP
// Robinson House by Marcel Breuer

PFont font;

void setup() {
  size(664, 664);
  background(255);
  rectMode(CORNERS);
  smooth();

  font = loadFont("BankGothicBT-Medium-12.vlw");
}

int x=8;

void draw() {

  //thick walls
  strokeWeight (2);
  fill(0);
  quad (x*7.5, x*15.25, x*8.5, x*15.25, x*8.5, x*71.25, x*7.5, x*71.25);
  quad (x*22, x*3.5, x*22, x*13.5, x*23, x*13.5, x*23, x*3.5);
  quad (x*25, x*12.5, x*25, x*25.5, x*26, x*25.5, x*26, x*12.5);
  quad (x*25, x*12.5, x*37.5, x*12.5, x*37.5, x*13.5, x*25, x*13.5);
  quad (x*36.5, x*9, x*36.5, x*25.5, x*37.5, x*25.5, x*37.5, x*9);
  quad (x*43.5, x*58.75, x*43.5, x*82.5, x*44.5, x*82.5, x*44.5, x*58.75);
  quad (x*36.75, x*40, x*36.75, x*41, x*59.25, x*41, x*59.25, x*40);
  quad (x*40.25, x*48.5, x*40.25, x*49.5, x*61.25, x*49.5, x*61.25, x*48.5);
  quad (x*58, x*15.25, x*58, x*25.5, x*59, x*25.5, x*59, x*15.25);
  quad (x*58, x*28.75, x*59, x*28.75, x*59, x*37, x*58, x*37);
  quad (x*75.25, x*15.25, x*76.25, x*15.25, x*76.25, x*30.75, x*75.25, x*30.75);
  quad (x*75.25, x*51, x*75.25, x*62.25, x*76.25, x*62.25, x*76.25, x*51);

  //thin outer walls
  stroke (100, 100);
  fill (100);
  quad (x*59.25, x*30.25, x*76.25, x*30.25, x*76.25, x*30.75, x*59.25, x*30.75);
  quad (x*75.75, x*62.25, x*75.75, x*71.25, x*76.25, x*71.25, x*76.25, x*62.25);
  quad (x*58, x*70.75, x*58, x*71.25, x*76.25, x*71.25, x*76.25, x*70.75);
  quad (x*35.5, x*25.5, x*41.5, x*25.5, x*41.5, x*26, x*35.5, x*26);
  quad (x*41, x*49.75, x*41.5, x*49.75, x*41.5, x*58.75, x*41, x*58.75);

  //glass windows
  line (x*15, x*25.5, x*33.5, x*25.5);
  line (x*40, x*26, x*40, x*40);
  line (x*15, x*25.5, x*15, x*58.75);
  line (x*15, x*58.75, x*41.5, x*58.75);
  line (x*58, x*49.5, x*58, x*71.25);
  line (x*76.25, x*51, x*76.25, x*30.75);
}


float startX;
float startY;
void mousePressed () {
  startX =mouseX;
  startY =mouseY;  

  textFont(font); 
  String s = "Press Spacebar to Clear Screen.";
  text(s, 30, 590, width, height);
}

//drawing interior walls 
void mouseDragged() {

  //Indicators (showing where to start the walls)
  if (startX > x*15 && startX < x*38 && startY > x*26 && startY < x*58) {
    float mY=constrain (mouseY, x*26, x*58);
    float mX=constrain (mouseX, x*15, x*38);
    line(startX, startY, startX, mY);
    line(startX, startY, mX, startY);
    fill(mouseY, mouseX, mouseX);
    noStroke();
    rectMode(CORNERS);
    rect (x*68.5, x*57.25, x*69.5, x*58.25);
    rect (x*66, x*41.5, x*67, x*42.5);
    if (startX - mX > mX - startX || startY - mY > mY - startY) {
      stroke(255, 255, 255, 255);
      strokeWeight(10);
      line(startX, startY, startX, mY);
      line(startX, startY, mX, startY);
    }
  }

  //second main volume
  stroke(100);
  if (startX > x*38 && startX < 58*x && startY >40*x && startY <49.75*x) {
    float mX2=constrain(mouseX, 39.5*x, 58*x);
    float mY2=constrain(mouseY, 40*x, 49.75*x);
    //Main Interior Wall
    line (startX, startY, startX, mY2);
    line (startX, startY, mX2, startY);
  }

  //third main volume
  if (startX > x*63 && startX <x*69 && startY > x*57 && startY < x*71.25) {
    float mY3a=constrain (mouseY, x*57, x*71);
    strokeWeight(5);
    line (startX, startY, startX, mY3a);
    if (mY3a-startY >x*8) {
      float mX3b=constrain (mouseX, startX, x*76);
      float mX3c=constrain (mouseX, x*58, startX-48);
      strokeWeight(2);
      line (startX, x*65, startX+24, x*65);
      line (startX+48, x*65, mX3b, x*65);
      line (startX+54, x*62, mX3b, x*62);

      if (mY3a-startY >x*11) { 
        line (startX-24, startY-24, mX3b, startY-24);
        line (x*58, startY-24, mX3c, startY-24);
        strokeWeight(5);
        line (startX, startY-24, startX, startY-18);
        line (startX-24, startY-24, startX-24, startY-28);
        line (startX-24, startY-48, startX-14, startY-48);
        line (startX-14, startY-48, startX-14, x*49.75);
      }
    }
  }

  if (startX > x*63 && startX <x*76 && startY > x*41.5 && startY < x*46) {
    float mY3d =constrain (mouseY, x*41.5, x*49.5);
    float mY3e =constrain (mouseY, x*49.75, x*53);
    float mY3f =constrain (mouseY, x*55, x*57);
    float mX3d =constrain (mouseX, x*65.5, x*70.5);
    float mX3e =constrain (mouseX, x*65.5, x*76);
    strokeWeight(2);
    line (startX, startY, startX, mY3d); 
    line (x*65.5, x*49.75, mX3d, x*49.75); 
    line (x*72.5, x*49.75, x*76, x*49.75); 
    strokeWeight(1.12);
    line (x*70.5, x*49.75, x*70.5, mY3e);
    line (x*70.5, x*55, x*70.5, mY3f);
    if (mY3d-startY >x*5) {
      strokeWeight(1.12);
      line (x*65.5, startY, mX3e, startY);
      if (mX3e-startX >x*9) {
        strokeWeight(2);
        line (x*62.5, startY, x*62.5, x*38.75);
        line (x*62.5, x*37.25, x*62.5, x*34.25);
        line (x*62.5, x*32.75, x*62.5, x*30.75);
        line (x*59.25, x*35.5, x*62.5, x*35.5);
      }
    }
  }
}  


//Clearing the Screen  
void keyPressed() {

  //thick walls
  strokeWeight (0);

  fill(255);
  rect (x*15, x*25.5, x*41.5, x*58.75);
  rect (x*41.5, x*40, x*58, x*49.75);
  rect (x*58, x*15.25, x*76.5, x*71.25);
  quad (x*7.5, x*15.25, x*8.5, x*15.25, x*8.5, x*71.25, x*7.5, x*71.25);
  quad (x*22, x*3.5, x*22, x*13.5, x*23, x*13.5, x*23, x*3.5);
  quad (x*25, x*12.5, x*25, x*25.5, x*26, x*25.5, x*26, x*12.5);
  quad (x*25, x*12.5, x*37.5, x*12.5, x*37.5, x*13.5, x*25, x*13.5);
  quad (x*36.5, x*9, x*36.5, x*25.5, x*37.5, x*25.5, x*37.5, x*9);
  quad (x*43.5, x*58.75, x*43.5, x*82.5, x*44.5, x*82.5, x*44.5, x*58.75);
  quad (x*36.75, x*40, x*36.75, x*41, x*59.25, x*41, x*59.25, x*40);
  quad (x*40.25, x*48.5, x*40.25, x*49.5, x*61.25, x*49.5, x*61.25, x*48.5);
  quad (x*58, x*15.25, x*58, x*25.5, x*59, x*25.5, x*59, x*15.25);
  quad (x*58, x*28.75, x*59, x*28.75, x*59, x*37, x*58, x*37);
  quad (x*75.25, x*15.25, x*76.25, x*15.25, x*76.25, x*30.75, x*75.25, x*30.75);
  quad (x*75.25, x*51, x*75.25, x*62.25, x*76.25, x*62.25, x*76.25, x*51);

  //thin outer walls
  stroke (100, 100);
  fill (100);
  quad (x*59.25, x*30.25, x*76.25, x*30.25, x*76.25, x*30.75, x*59.25, x*30.75);
  quad (x*75.75, x*62.25, x*75.75, x*71.25, x*76.25, x*71.25, x*76.25, x*62.25);
  quad (x*58, x*70.75, x*58, x*71.25, x*76.25, x*71.25, x*76.25, x*70.75);
  quad (x*35.5, x*25.5, x*41.5, x*25.5, x*41.5, x*26, x*35.5, x*26);
  quad (x*41, x*49.75, x*41.5, x*49.75, x*41.5, x*58.75, x*41, x*58.75);

  //glass windows
  line (x*15, x*25.5, x*33.5, x*25.5);
  line (x*40, x*26, x*40, x*40);
  line (x*15, x*25.5, x*15, x*58.75);
  line (x*15, x*58.75, x*41.5, x*58.75);
  line (x*58, x*49.5, x*58, x*71.25);
  line (x*76.25, x*51, x*76.25, x*30.75);
}


