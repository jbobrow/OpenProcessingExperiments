
int tierFill1 = 255;
int tierFill2 = 255;
int tierFill3 = 0;
int tierFill5 = 0;

boolean tierFill4, tierFill4p;
boolean tierFill6, tierFill6p;

void setup() {
  size (500, 500);
  background (200);
  rectMode (CENTER);
  smooth();
}

void draw() {
  noStroke();
  //tier 1
  fill (tierFill1);
  rect (width/2, height/2, 100, 100);
  //tier 2
  fill (tierFill2);
  rect (325, 325, 50, 50);
  rect (325, 175, 50, 50);
  rect (175, 325, 50, 50);
  rect (175, 175, 50, 50);
  //tier 3
  fill (tierFill3);
  rect (width/2, 113, 100, 75);
  rect (width/2, 387, 100, 75);
  //tier 4
  fill ((tierFill4p) ? 255 : 0);
  rect (75, height/2, 150, 100);
  rect (425, height/2, 150, 100);
  //tier 5
  fill (tierFill5);
  rect (width/2, 25, 100, 50);
  rect (width/2, 475, 100, 50);
  //tier 6
  fill ((tierFill6) ? 0 : 255);
  rect (75, 75, 150, 150);
  rect (75, 425, 150, 150);
  rect (425, 75, 150, 150);
  rect (425, 425, 150, 150);

  strokeWeight (2);
  //tier 1
  String arrowBlock1 = "↓";
  fill (0);
  text (arrowBlock1, 250, 250); 
  //tier 2
  String arrowBlock2 = "↨";
  fill (0);
  text (arrowBlock2, 325, 325);
  text (arrowBlock2, 325, 175);
  text (arrowBlock2, 175, 325);
  text (arrowBlock2, 175, 175);
  //tier 3
  String arrowBlock3 = "↨";
  fill (255);
  text (arrowBlock3, 250, 113);
  text (arrowBlock3, 250, 387);
  //tier 4
  String arrowBlock4 = "⇊";
  fill (255);
  text (arrowBlock4, 75, 250);
  text (arrowBlock4, 425, 250);
  String arrowBlock4a = "⇊";
  fill (0);
  text (arrowBlock4a, 70, 245);
  text (arrowBlock4a, 420, 245);
  //tier 5
  String arrowBlock5 = "↑";
  fill(255);
  text (arrowBlock5, 250, 25);
  text (arrowBlock5, 250, 475);
  //tier6
  String arrowBlock6 = "⇈";
  fill (0);
  text (arrowBlock6, 75, 75);
  text (arrowBlock6, 75, 425);
  text (arrowBlock6, 425, 75);
  text (arrowBlock6, 425, 425);
  String arrowBlock6a = "⇈";
  fill (255);
  text (arrowBlock6a, 70, 70);
  text (arrowBlock6a, 70, 420);
  text (arrowBlock6a, 420, 70);
  text (arrowBlock6a, 420, 420);
}


void mousePressed() {
  //tier 1 - perm press
  if ((mouseX > 200) && (mouseX <300) && (mouseY > 200) && (mouseY < 300)) {
    tierFill1 = 0;
  }
  //tier 2 -press, release
  if (((mouseX > 300) && (mouseX < 350) && (mouseY > 300) && (mouseY < 350)) || ((mouseX > 300) && 
    (mouseX < 350) && (mouseY > 150) && (mouseY < 200)) || ((mouseX > 150) && (mouseX < 200) && 
    (mouseY > 300) && (mouseY < 350)) || ((mouseX > 150) && (mouseX < 200) && (mouseY > 150) &&
    (mouseY < 200))) {
    tierFill2 = 0;
  }
  //tier 3 - press, release
  if (((mouseX > 200) && (mouseX < 300) && (mouseY > 76) && (mouseY < 150)) || ((mouseX > 200) &&
    (mouseX < 300) && (mouseY > 350) && (mouseY < 424))) {
    tierFill3 = 255;
  }
  //tier 4 - press, press
  if (((mouseX < 150) && (mouseY > 200) && (mouseY < 300)) || ((mouseX > 350) && (mouseY > 200) &&
    (mouseY < 300))) {
    tierFill4 = !tierFill4;
  }
  if (((mouseX < 150) && (mouseY > 200) && (mouseY < 300)) || ((mouseX > 350) && (mouseY > 200) &&
    (mouseY < 300))) {
    tierFill4p = !tierFill4p;
  }
}


void mouseReleased() {
  //tier 2 press, release
  if (((mouseX > 300) && (mouseX < 350) && (mouseY > 300) && (mouseY < 350)) || ((mouseX > 300) && 
    (mouseX < 350) && (mouseY > 150) && (mouseY < 200)) || ((mouseX > 150) && (mouseX < 200) && 
    (mouseY > 300) && (mouseY < 350)) || ((mouseX > 150) && (mouseX < 200) && (mouseY > 150) &&
    (mouseY < 200))) {
    tierFill2 = 255;
  }
  //tier 3 press, release
  if (((mouseX > 200) && (mouseX < 300) && (mouseY > 76) && (mouseY < 150)) || ((mouseX > 200) &&
    (mouseX < 300) && (mouseY > 350) && (mouseY < 424))) {
    tierFill3 = 0;
  }
  //tier 5 - perm release
  if (((mouseX > 200) && (mouseX < 300) && (mouseY < 50)) || ((mouseX > 200) && (mouseX < 300) && 
    (mouseY > 450))) {
    tierFill5 = 255;
  }
  //tier 6 - press, press
  if (((mouseX < 150) && (mouseY < 150)) || ((mouseX < 150) && (mouseY > 350)) || ((mouseX > 350) && 
    (mouseY < 150)) || ((mouseX > 350) && (mouseY > 350))) {
    tierFill6 = !tierFill6;
  }
  if (((mouseX < 150) && (mouseY < 150)) || ((mouseX < 150) && (mouseY > 350)) || ((mouseX > 350) && 
    (mouseY < 150)) || ((mouseX > 350) && (mouseY > 350))) {
    tierFill6p = !tierFill6p;
  }
}
