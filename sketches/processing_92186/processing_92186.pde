
float[] X = new float[7];
float[] Y = new float[7];

int traceStep = 0;
int[] checkPoints = new int[7];

int state = 1;

void setup() {

  size(800, 800);
  background(255);
  smooth();
  frameRate(24);
  generateSpline();
}

void draw() {
  
//line(mouseX, mouseY, pmouseX, pmouseY);

  switch(state) {


    //**********State_Reset***********//
  case 1: 
    delay(500);
    state = 2;
    generateSpline();
    drawSpline();
    fill(220, 50, 50, 90);
    for (int i = 1; i<X.length - 1; i++) {
      ellipse(X[i], Y[i], 15, 15);
    }
    textSize(22);
    fill(0, 102, 153);
    text("1", X[1]+8, Y[1]+12);
    traceStep = 0;
    break;


    //********State_Tracing**********//
  case 2: 
    //nothing has been traced yet
    if ( X[1]-35 < mouseX && mouseX < X[1]+35 && Y[1]-35 < mouseY && mouseY < Y[1]+35 && traceStep == 0) {
      drawSpline();
      fill(220, 50, 50, 90);
      for (int i = 2; i<X.length - 1; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      fill(50, 205, 50, 90);
      for (int i = 1; i<= 1; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      traceStep = 1;
      fill(0, 102, 153);
      text("2", X[2]+8, Y[2]+12);
    }
    //1st point traced, check for 2nd
    if ( X[2]-35 < mouseX && mouseX < X[2]+35 && Y[2]-35 < mouseY && mouseY < Y[2]+35 && traceStep == 1) {
      drawSpline();
      fill(220, 50, 50, 90);
      for (int i = 3; i<X.length - 1; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      fill(50, 205, 50, 90);
      for (int i = 1; i<= 2; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      traceStep = 2;
      fill(0, 102, 153);
      text("3", X[3]+8, Y[3]+12);
    }
    //2nd point traced, check for 3rd
    if ( X[3]-35 < mouseX && mouseX < X[3]+35 && Y[3]-35 < mouseY && mouseY < Y[3]+35 && traceStep == 2) {
      drawSpline();
      fill(220, 50, 50, 90);
      for (int i = 4; i<X.length - 1; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      fill(50, 205, 50, 90);
      for (int i = 1; i<= 3; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      traceStep = 3;
      fill(0, 102, 153);
      text("4", X[4]+8, Y[4]+12);
    }
    //3rd point traced, check for 4th
    if ( X[4]-35 < mouseX && mouseX < X[4]+35 && Y[4]-35 < mouseY && mouseY < Y[4]+35 && traceStep == 3) {
      drawSpline();
      fill(220, 50, 50, 90);
      for (int i = 5; i<X.length - 1; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      fill(50, 205, 50, 90);
      for (int i = 1; i<= 4; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      traceStep = 4;
      fill(0, 102, 153);
      text("5", X[5]+8, Y[5]+12);
    }
    //4th point traced, check for 5th
    if ( X[5]-35 < mouseX && mouseX < X[5]+35 && Y[5]-35 < mouseY && mouseY < Y[5]+35 && traceStep == 4) {
      drawSpline();
      fill(220, 50, 50, 90);
      for (int i = 6; i<X.length - 1; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      fill(50, 205, 50, 90);
      for (int i = 1; i<= 5; i++) {
        ellipse(X[i], Y[i], 15, 15);
      }
      traceStep = 5;
      state = 1;
    }

    break;

  case 3: //State_Check1: first circle traced

    break;
  }
}


//**Generates coordinates for a new Spline**//
void generateSpline() {
  for (int i=0; i < X.length; i++) {
    X[i] = random(50, 750);
  }
  for (int i=0; i < Y.length; i++) {
    Y[i] = random(50, 750);
  }
}


//**DRAW SPLINE FUNCTION**//    draws background overlayed with spline. Used initially and after each change in a gem
void drawSpline() {      
  fill(255);
  rect(0, 0, 800, 800);
  noFill();
  stroke(0);
  beginShape();
  curveVertex(X[0], Y[0]);
  curveVertex(X[1], Y[1]);
  curveVertex(X[2], Y[2]);
  curveVertex(X[3], Y[3]);
  curveVertex(X[4], Y[4]);
  curveVertex(X[5], Y[5]);
  curveVertex(X[6], Y[6]);
  endShape();
}



