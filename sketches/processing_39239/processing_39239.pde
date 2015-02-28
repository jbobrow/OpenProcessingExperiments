
              
                // setting up a list called "boxColors" to hold 10 integers 
int[] boxColors = new int[10];
// "boxColors" = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
int[] arrowColors = new int[10];

void setup () {
  // iterating from 0 to the length of the list "boxColors" (10)
  // where "i" is the index of each value in the list
  for (int i =0; i<10; i++) {
    if (i<5) {
      //      index value
      boxColors[i] = 0;
      arrowColors[i] = 255;
    } 
    else {
      boxColors[i] = 255;
      arrowColors[i] = 0;
    }
  }
  // "boxColors" = [0, 0, 0, 0, 0, 255, 255, 255, 255, 255]
  // indices =      0, 1, 2, 3, 4,  5,   6,   7,   8,   9

  size (505, 205);
  smooth();
}
void draw() {
  background (127);
  noStroke ();

  //press and release - up

  if (mouseX >5 && mouseX <100 && mouseY >5 && mouseY <100) {
    if (mousePressed) {
      boxColors[0] = 255;
      arrowColors[0] = 0;
    }
    else {
      boxColors[0] = 0;
      arrowColors[0] = 255;
    }
  }

  // press and release - lower

  if (mouseX >5 && mouseX <100 && mouseY >100 && mouseY <195) {
    if (mousePressed) {
      boxColors[5] = 0;
      arrowColors[5] = 255;
    }
    else {
      boxColors[5] =255;
      arrowColors[5] = 0;
    }
  } 

  for (int col = 0; col <5; col ++) {
    for (int row =0; row <2; row++) {
      fill(boxColors[col+(5*row)]);
      rect ((col*100)+5, (row*100)+5, 95, 95);
      fill(arrowColors[col+(5*row)]);
      if (col == 0){
        rect((col*100)+50, (row*100)+40, 10, 30);
      } else if (col == 3) {
        rect((col*100)+50, (row*100)+20, 10, 50);
      } 
      else if (col == 4) {
        rect((col*100)+50, (row*100)+40, 10, 50);
      }
      else if (col == 2) {
        rect((col*100)+42, (row*100)+40, 10, 50);
        rect((col*100)+58, (row*100)+40, 10, 50);
      }
      else if (col == 1) {
        rect((col*100)+42, (row*100)+20, 10, 50);
        rect((col*100)+58, (row*100)+20, 10, 50);
      }
      if (col == 0) {
        triangle((col*100)+55, (row*100)+20, (col*100)+30, (row*100)+40, (col*100)+80, (row*100)+40);
        triangle((col*100)+55, (row*100)+90, (col*100)+30, (row*100)+70, (col*100)+80, (row*100)+70);
      }
      else if (col % 2 == 1) {
        triangle((col*100)+55, (row*100)+90, (col*100)+30, (row*100)+70, (col*100)+80, (row*100)+70);
      } 
      else if (col % 2 == 0) {
        triangle((col*100)+55, (row*100)+20, (col*100)+30, (row*100)+40, (col*100)+80, (row*100)+40);
      }
    }
  }
}

void mousePressed() {
  //mouse clicked stay up

  if ((boxColors[1] == 255)&&(mouseX<=205) && (mouseX >= 105) && (mouseY <=105) && (mouseY >= 5)) {
    boxColors[1] = 0;
    arrowColors[1] = 255;
  }
  else if ((boxColors[1] == 0) && (mouseX<=205) && (mouseX >= 105) && (mouseY <=105) && (mouseY >= 5)) {
    boxColors[1] = 255;
    arrowColors[1] = 0;
  }

  //lower clickityclcks

  if ((boxColors[6]== 0)&&(mouseX<=205) && (mouseX >= 105) && (mouseY <=205) && (mouseY >= 105)) {
    boxColors[6] = 255;
    arrowColors[6] = 0;
  }
  else if ((boxColors[6] == 255)&&(mouseX<=200) && (mouseX >= 100) && (mouseY <=195) && (mouseY >= 100)) {
    boxColors[6] = 0;
    arrowColors[6] = 255;
  }

  //mouse press stay up

  if (mouseX >305 && mouseX <400 && mouseY >5 && mouseY <100) {
    boxColors[3] = 255;
    arrowColors[3] = 0;
  }

  // mouse press stay down

  if (mouseX >305 && mouseX <400 && mouseY >100 && mouseY <195) {
    boxColors[8] = 0;
    arrowColors[8] = 255;
  }
}

void mouseReleased() {
  // top release change
  if ((boxColors[2] == 255)&&(mouseX<=300) && (mouseX >= 205) && (mouseY <=105) && (mouseY >= 5)) {
    boxColors[2] = 0;
    arrowColors[2] = 255;
  }
  else if ((boxColors[2] == 0) && (mouseX<=300) && (mouseX >= 205) && (mouseY <=105) && (mouseY >= 5)) {
    boxColors[2] = 255;
    arrowColors[2] = 0;
  }
  //bottom release change
  if ((boxColors[7] == 0)&&(mouseX<=300) && (mouseX >= 205) && (mouseY <=200) && (mouseY >= 105)) {
    boxColors[7] = 255;
    arrowColors[7] = 0;
  }
  else if ((boxColors[7] == 255) && (mouseX<=300) && (mouseX >= 205) && (mouseY <=200) && (mouseY >= 105)) {
    boxColors[7] = 0;
    arrowColors[7] = 255;
  }
  //bottom one time release
  if (mouseX >405 && mouseX <500 && mouseY >100 && mouseY <195) {
    boxColors[9] = 0;
    arrowColors[9] = 255;
  }
  //top one time release
  if (mouseX >405 && mouseX <500 && mouseY >5 && mouseY <100) {
    boxColors[4] = 255;
    arrowColors[4] = 0;
  }
}

