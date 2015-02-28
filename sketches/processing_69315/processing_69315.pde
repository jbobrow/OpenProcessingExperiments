
// Homework #2, 48-757, 11:30AM
// Copyright M. Yvonne Hidle
// M. Yvonne Hidle
// yvonnehidle@gmail.com

// arrow keys (up, down, right, and left) move pacman
// position of pacman changes shapes and colors in the background


// variables stated
float circleX;
float circleY;
float circleW;
float circleH;
float pmouthA;
float pmouthB;
float eyeColor;
float dotX;
float dotY;

// setting up the drawing
void setup () {

  // basic parameters
  background(255);
  size(800, 400);
  smooth();
  frameRate(60);

  // variables starting
  circleX = 50;
  circleY = 50;
  circleW = 100;
  circleH = circleW;
  pmouthA = radians(-30);
  pmouthB = radians(30);
  eyeColor = 255;
  dotX = 30;
  dotY = 30;
}


// the drawing
void draw () {

  // basic parameters
  background(255);

  // setup dots
  for (float dotYY=dotY/2; dotYY < 399; dotYY+=dotY) {
    for (float dotXX=dotX/2; dotXX < 799; dotXX+=dotX) {

      if (circleX > dotXX) {
        fill(240);
        ellipse(dotXX, dotYY, 20, 20);
      }

      else if (circleY > dotYY) {
        fill(255);
        ellipse(dotXX, dotYY, 20, 20);
      }

      else {
        fill(198, 229, 245);
        rect(dotXX,dotYY,20,20);
      }
    }
  }

  //drawing pacman
  // PACMAN Head
  ellipseMode(CENTER);
  fill(137, 172, 191);
  noStroke();
  ellipse(circleX, circleY, circleW, circleH);
  // PACMAN Mouth
  fill(54, 62, 79);
  stroke(255);
  strokeWeight(circleW/210*10);
  arc(circleX, circleY, circleW, circleH, pmouthA, pmouthB);
  //PACMAN Eye
  float eyeY, eyeX;
  eyeY = circleY-circleH/4;
  eyeX = circleX+circleW/8;
  noStroke();
  fill(eyeColor);
  ellipse(eyeX, eyeY, circleW*.15, circleH*.15);

  // Intials Y
  // Y - first leg
  float changeStroke;
  changeStroke = circleW/160;
  stroke(255);
  strokeWeight(4*changeStroke);
  noFill();
  beginShape();
  curveTightness(6);
  curveVertex(circleX-circleW/5.333333333, circleY);
  curveVertex(circleX-circleW/5.333333333, circleY);
  curveVertex(circleX-circleW/4, circleY+circleH/16);
  curveVertex(circleX-circleW/16, circleY+circleH/5.333333333);
  curveVertex(circleX-circleW/16, circleY+circleH/5.333333333);
  endShape();
  // Y - second leg curve
  beginShape();
  curveTightness(6);
  curveVertex(circleX, circleY);
  curveVertex(circleX, circleY);
  curveVertex(circleX, circleY+circleH/2.285714286);
  curveVertex(circleX-circleW/8, circleY+circleH/2.285714286);
  curveVertex(circleX-circleW/16, circleY+circleH/3.2);
  curveVertex(circleX-circleW/16, circleY+circleH/3.2);
  endShape();
  // H - first leg
  stroke(198, 229, 245);
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/32, circleY+circleH/8);
  curveVertex(circleX+circleW/32, circleY+circleH/8);
  curveVertex(circleX+circleW/10.66666667, circleY+circleH/6.4);
  curveVertex(circleX+circleW/8, circleY+circleH/2.666666667);
  curveVertex(circleX+circleW/8, circleY+circleH/2.666666667);
  endShape();
  // H - second leg
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/5.333333333, circleY+circleH/6.4);
  curveVertex(circleX+circleW/5.333333333, circleY+circleH/6.4);
  curveVertex(circleX+circleW/4.571428571, circleY+circleH/5.333333333);
  curveVertex(circleX+circleW/4, circleY+circleH/2.666666667);
  curveVertex(circleX+circleW/4, circleY+circleH/2.666666667);
  endShape();
  // H - middle leg
  beginShape();
  curveTightness(1);
  curveVertex(circleX+circleW/32, circleY+circleH/3.555555556);
  curveVertex(circleX+circleW/32, circleY+circleH/3.555555556);
  curveVertex(circleX+circleW/2.666666667, circleY+circleH/4);
  curveVertex(circleX+circleW/3.2, circleY+circleH/2.909090909);
  curveVertex(circleX+circleW/3.2, circleY+circleH/2.909090909);
  endShape();
}


//moving pacman with arrow keys
void keyPressed() {
  if (key == CODED) {

    if (keyCode == UP) {
      circleY = circleY-10;
      circleY = constrain(circleY, 0, height);
      pmouthA = radians(random(-30, 0));
      pmouthB = radians(random(0, 30));
    } 
    else if (keyCode == DOWN) {
      circleY = circleY+10;
      circleY = constrain(circleY, 0, height);
      pmouthA = radians(random(-30, 0));
      pmouthB = radians(random(0, 30));
    }
    else if (keyCode == LEFT) {
      circleX = circleX-10;
      circleX = constrain(circleX, 0, width);
      pmouthA = radians(random(-30, 0));
      pmouthB = radians(random(0, 30));
    }
    else if (keyCode == RIGHT) {
      circleX = circleX+10;
      circleX = constrain(circleX, 0, width);
      pmouthA = radians(random(-30, 0));
      pmouthB = radians(random(0, 30));
    }
    else {
      circleY = circleY;
      circleX = circleX;
    }
  }
}


