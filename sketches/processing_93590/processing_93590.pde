
//Chris Pro Midterm
//Tic Tac Toe
//Mouse click on a space to go and press any key to reset the board
int rectH = 100;
int rectW = 100;


void setup() {
  //window setup and game board
  size(300, 300);
  background(255);
  rect(0, 0, rectW, rectH);
  rect(0, 100, rectW, rectH);
  rect(0, 200, rectW, rectH);
  rect(100, 0, rectW, rectH);
  rect(100, 100, rectW, rectH);
  rect(100, 200, rectW, rectH);
  rect(200, 0, rectW, rectH);
  rect(200, 100, rectW, rectH);
  rect(200, 200, rectW, rectH);
}

void draw() {
  if (mousePressed) {
    //1st button (space 1,0)
    if (mouseX>0 && mouseX<100 && mouseY>0 && mouseY<100) {
      ellipseMode(CORNER);
      ellipse(0, 0, 100, 100);
    }

    //2nd button (space 1,2)
    if (mouseX>100 && mouseX<200 && mouseY>0 && mouseY<100) {
      line(100, 0, 200, 100);
      line(100, 100, 200, 0);
    }

    //3rd button (space 1,3)
    if (mouseX>200 && mouseX<300 && mouseY>0 && mouseY<100) {
      ellipseMode(CORNER);
      ellipse(200, 0, 100, 100);
    }

    //4th button (space 2,1)
    if (mouseX>0 && mouseX<100 && mouseY>100 && mouseY<200) {
      line(0, 100, 100, 200);
      line(100, 100, 0, 200);
    }

    //5th button (space 2,2)
    if (mouseX>100 && mouseX<200 && mouseY>100 && mouseY<200) {
      ellipseMode(CORNER);
      ellipse(100, 100, 100, 100);
    }

    //6th button (space 2,3)
    if (mouseX>200 && mouseX<300 && mouseY>100 && mouseY<200) {
      line(200, 100, 300, 200);
      line(200, 200, 300, 100);
    }

    //7th button (space 3,1)
    if (mouseX>0 && mouseX<100 && mouseY>200 && mouseY<300) { 
      ellipseMode(CORNER);
      ellipse(0, 200, 100, 100);
    } 

    //8th button (space 3,2)
    if (mouseX>100 && mouseX<200 && mouseY>200 && mouseY<300) {
      line(100, 200, 200, 300);
      line(200, 200, 100, 300);
    }  

    //9th button (space 3,3)
    if (mouseX>200 && mouseX<300 && mouseY>200 && mouseY<300) { 
      ellipseMode(CORNER);
      ellipse(200, 200, 100, 100);
    }
  }

  //Pressing any key will reset the game board
  if (keyPressed) {
    rect(0, 0, rectW, rectH);
    rect(0, 100, rectW, rectH);
    rect(0, 200, rectW, rectH);
    rect(100, 0, rectW, rectH);
    rect(100, 100, rectW, rectH);
    rect(100, 200, rectW, rectH);
    rect(200, 0, rectW, rectH);
    rect(200, 100, rectW, rectH);
    rect(200, 200, rectW, rectH);
  }
}



