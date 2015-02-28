

float majorAxis, minorAxis, sizeIncrement, axisRatio, theta, thetaIncrement, upperHue, lowerHue, fillOpacity;
boolean fillActive, strokeActive, strokeIsWhite;

void setup() {

  size(500, 500);
  background(0);

  majorAxis = 10; //starting majorAxis value
  axisRatio = 0.5; //starting ratio minorAxis/majorAxis
  minorAxis = majorAxis * axisRatio;
  sizeIncrement = 3.5; //amount that majorAxis is incremented by.

  theta = 0;
  thetaIncrement = PI/2;

  lowerHue = 22;
  upperHue = 250;

  fillActive = true;
  fillOpacity = 200;

  strokeActive = true;
  strokeIsWhite = false;


  colorMode(HSB, 360, 100, 100);
}


void draw() {

  background(0);

  stroke(360);

  theta = 0;
  majorAxis = width/2;

  axisRatio = map(mouseX, 0, width, 0.1, 0.9);
  thetaIncrement = map(mouseY, 0, height, PI/60, PI);


  //println(fillOpacity);
  

  translate(width/2, height/2);
  while (majorAxis > 0) {



    if (fillActive) {
      fill(map(majorAxis, 0, 360, lowerHue, upperHue), 80, 80, fillOpacity);
    }
    else {
      noFill();
    }

    if (strokeActive) {
      if (strokeIsWhite) {

        //stroke(0);
        stroke(225);
      }
      else {
        stroke(map(majorAxis, 0, 360, lowerHue, upperHue), 80, 80, 255);
      }
    }
    else {
      noStroke();
    }

    minorAxis = majorAxis * axisRatio;

    //println("majorAxis = " + majorAxis + " minorAxis = " + minorAxis + " lowerHue = " + lowerHue + " upperHue = " + upperHue);

    pushMatrix();
    rotate(theta);  
    quad(minorAxis, 0, 0, majorAxis, -1*minorAxis, 0, 0, -1*majorAxis);  
    popMatrix();

    theta += thetaIncrement;
    majorAxis -=sizeIncrement;
  }
}


void keyPressed() {
println(key);
 //w and w change sizeIncrement
    if (key =='q' || key == 'Q') {
      if (sizeIncrement < width/2) {
        sizeIncrement +=0.1;
      }
    }
    else if (key =='w' || key == 'W') {
      if (sizeIncrement >1) {
        sizeIncrement -=0.1;
      }
    }

    //a and s change lowerHue
    else if (key =='s' || key == 'S') {
      if (lowerHue > 3) {

        lowerHue -=3;
      }
    }
    else if (key =='a' || key == 'A') {
      if (lowerHue <357) {
        lowerHue +=3;
      }
    }

    //x and z change upperHue
    else if (key =='x' || key == 'X') {
      if (upperHue > 3) {
        upperHue -=3;
      }
    }
    else if (key =='z' || key == 'Z') {
      if (upperHue <357) {
        upperHue +=3;
      }
    }

    //f turns fill on and off
    else if (key == 'f' || key =='F') {
      if (fillActive) {
        fillActive = false;
      } 
      else {
        fillActive = true;
      }
    }

    //e and r change fillOpacity
    else if (key =='e' || key == 'R') {
      if (fillOpacity > 3) {
        fillOpacity -=3;
      }
    }
    else if (key =='r' || key == 'R') {
      if (fillOpacity <252) {
        fillOpacity +=3;
      }
    }


    //d turns stroke on and off
    else if (key == 'd' || key =='D') {
      if (strokeActive) {
        strokeActive = false;
      } 
      else {
        strokeActive = true;
      }
    }

    //c turns stroke between white and colored
    else if (key == 'c' || key =='C') {
      if (strokeIsWhite) {
        strokeIsWhite = false;
      } 
      else {
        strokeIsWhite = true;
      }
    }
 }

