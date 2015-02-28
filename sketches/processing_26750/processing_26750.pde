
/*Kevin Keables
DMST 2100
2011*/
float oldX, oldY;
int s = 1;
PFont fontA;
void setup () {
  size (500,500);
  smooth();
  background(200);
  fontA = loadFont ("LucidaGrande-48.vlw");
  textFont (fontA,12);
  //noCursor(); 
       stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse(470, 40, 20, 20);
  ellipse(470, 65, 15, 15);
  ellipse(470, 85, 10, 10);
  ellipse(470, 100, 5, 5);
  ellipse(470, 110, 2, 2);
  ellipse(470, 117, 1, 1);
  fill(255,0,0);
  rect(30,470,15,15);
  fill(255,100,0);
  rect(45,470,15,15);
  fill(255,255,0);
  rect(60,470,15,15);
  fill(0,255,0);
  rect(75,470,15,15);
  fill(0,255,255);
  rect(90,470,15,15);
  fill(0,100,255);
  rect(105,470,15,15);
  fill(0,0,255);
  rect(120,470,15,15);
  fill(255,0,255);
  rect(135,470,15,15);
  fill(0);
  rect(150,470,15,15);
  fill(255);
  rect(165,470,15,15);
  fill(255);
  rect(450,450,50,50);
  rect(180,470,45,15);
  fill(0);
  text("CLEAR", 460,475);
  text("ERASER", 182,482);
  noFill();
  rect(0,0,450,450);
}
  void draw() {
  if (mousePressed && mouseY<450 && mouseX<450) {
    line(mouseX, mouseY, oldX, oldY);
  }
  oldX = mouseX;
  oldY = mouseY;
  if (mousePressed) {
    if (mouseY>470 && mouseY<485 && mouseX>30 && mouseX<45) {
      stroke(255,0,0);
    }
    if (mouseY>470 && mouseY<485 && mouseX>45 && mouseX<60) {
      stroke(255,100,0);
    }
    if (mouseY>470 && mouseY<485 && mouseX>60 && mouseX<75) {
      stroke(255,255,0);
    }
    if (mouseY>470 && mouseY<485 && mouseX>75 && mouseX<90) {
      stroke(0,255,0);
    }
    if (mouseY>470 && mouseY<485 && mouseX>90 && mouseX<105) {
      stroke(0,255,255);
    }
    if (mouseY>470 && mouseY<485 && mouseX>105 && mouseX<120) {
      stroke(0,100,255);
    }
    if (mouseY>470 && mouseY<485 && mouseX>120 && mouseX<135) {
      stroke(0,0,255);
    }
    if (mouseY>470 && mouseY<485 && mouseX>135 && mouseX<150) {
      stroke(255,0,255);
    }
    if (mouseY>470 && mouseY<485 && mouseX>150 && mouseX<165) {
      stroke(0);
    }
     if (mouseY>470 && mouseY<485 && mouseX>165 && mouseX<180) {
      stroke(255);
    }
    if (mouseY>470 && mouseY<485 && mouseX>180 && mouseX<225) {
      stroke(200);
    }
    if (mouseY>450 && mouseX>450) {
     background(200);
      stroke(0);
  strokeWeight(1);
  fill(0);
  ellipse(470, 40, 20, 20);
  ellipse(470, 65, 15, 15);
  ellipse(470, 85, 10, 10);
  ellipse(470, 100, 5, 5);
  ellipse(470, 110, 2, 2);
  ellipse(470, 117, 1, 1);
  fill(255,0,0);
  rect(30,470,15,15);
  fill(255,100,0);
  rect(45,470,15,15);
  fill(255,255,0);
  rect(60,470,15,15);
  fill(0,255,0);
  rect(75,470,15,15);
  fill(0,255,255);
  rect(90,470,15,15);
  fill(0,100,255);
  rect(105,470,15,15);
  fill(0,0,255);
  rect(120,470,15,15);
  fill(255,0,255);
  rect(135,470,15,15);
  fill(0);
  rect(150,470,15,15);
  fill(255);
  rect(165,470,15,15);
  fill(255);
  rect(450,450,50,50);
  rect(180,470,45,15);
  fill(0);
  text("CLEAR", 460,475);
  text("ERASER", 182,482);
    noFill();
  rect(0,0,450,450);
    }
  }
    if (mousePressed) {
      if (mouseY>30 && mouseY<50 && mouseX>460 && mouseX<480) {
        strokeWeight(20);
        int s = 20;
      }
      if (mouseY>57 && mouseY<73 && mouseX>463 && mouseX<478) {
        strokeWeight(15);
        int s = 15;
      }
      if (mouseY>80 && mouseY<90 && mouseX>465 && mouseX<475) {
        strokeWeight(10);
        int s = 10;
      }
      if (mouseY>97 && mouseY<103 && mouseX>467 && mouseX<472) {
        strokeWeight(5);
        int s = 5;
      }
      if (mouseY>108 && mouseY<112 && mouseX>468 && mouseX<472) {
        strokeWeight(2);
        int s = 2;
      }
      if (mouseY>115 && mouseY<119 && mouseX>468 && mouseX<472) {
        strokeWeight(1);
        int s = 1;
      }
    }
  }

