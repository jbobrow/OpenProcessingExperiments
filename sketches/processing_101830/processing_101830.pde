

float a = 0;
BranchComplex bc;
boolean useStroke = true;

void setup() {
  size(600, 600, P3D);
  bc = new BranchComplex();
  bc.b1.isTrunk = true;
  fill(180, 140, 30);
  textMode(SHAPE);
}

void draw() {
  background(255);
  lights();
  if (useStroke) stroke(180, 140, 30);
  else noStroke();

  a = map(mouseX, 0, width, 0, TWO_PI);
  pushMatrix();
  translate(width/2, height-100, 100);
  rotateY(a);
  bc.display();
  popMatrix();
}

void keyPressed() {
  if (key == 's') {
    if (useStroke == true) {
      useStroke = false;
    }
    else {
      useStroke = true;
    }
  }
}


class BranchComplex {

  OneBranch b1;
  int numBranches = 13;
  OneBranch[] b2 = new OneBranch[numBranches];
  OneBranch[][] b3 = new OneBranch[numBranches][4];

  BranchComplex() {
    b1 = new OneBranch(50);
    for (int i = 0; i < numBranches; i++) {
      int size = int( 30/(i*.2+1) );
      if (size == 0) {
        size = 1;
      }
      b2[i] = new OneBranch(size);

      for (int j = 0; j < 4; j++) {
        b3[i][j] = new OneBranch(size/3);
      }
    }
  }

  void display() {
    b1.display(b1, b1, 1, 0);
    for (int i = 1; i < numBranches; i++) {
      b2[i].display(b1, b2[i], numBranches, i);
      for (int j = 1; j < 4; j++) {
        b3[i][j].display(b2[i], b1, 4, j);
      }
    }
  }
}


class OneBranch {
  float angle;
  int arraySize;
  float[] x;
  float[] y;
  float[] z;
  float transX = 0;
  float transY = 0;
  float transZ = 0;
  float[] d;
  float xoff = 1;
  float yoff = 1;
  float zoff = 1;
  float xScale = .009;
  float yScale = .007;
  float zScale = .008;
  int numSides = 7;
  boolean happenedOnce = false;
  boolean useZ = false;
  float beginningDiameter = 20;
  float endingDiameter = 1;
  boolean isTrunk = false;

  OneBranch(int branchLength) {
    arraySize = branchLength;
    x = new float[arraySize];
    y = new float[arraySize];
    z = new float[arraySize];
    d = new float[arraySize];
  } 

  void display(OneBranch b, OneBranch mainB, int branches, int index) {
    if (b.useZ == true) {
      useZ = false;
    }
    if (b.useZ == false) {
      useZ = true;
    }

    pushMatrix();
    if (mainB.useZ == true && mainB != this) {
      rotateX(mainB.angle);
    }
    else if (mainB != this) {
      rotateZ(mainB.angle);
    }
    if (b != this) {
      translate(b.transX, b.transY, b.transZ);
    }
    if (b.useZ == true && b != this) {
      rotateX(b.angle);
    }  
    else if (b != this) {
      rotateZ(b.angle);
    }
    translate(transX, transY, transZ);
    if (useZ) {
      rotateX(angle);
    }  
    else {
      rotateZ(angle);
    }
    drawSquiggle();
    drawShell();
    popMatrix();

    if (mousePressed || happenedOnce == false) {
      happenedOnce = true;
      initArray(b, branches, index);
    }
  }

  void initArray(OneBranch b, int branches, int index) {
    if (isTrunk == false) {
      angle = random(TWO_PI);
    }
    else { 
     angle = PI/2; 
    }
    float k = map(index, 0, branches, b.arraySize - b.arraySize/1.5, b.arraySize-1);
    if (b != this) {
      transX = b.x[int(k)];
      transY = b.y[int(k)];
      transZ = b.z[int(k)];
      beginningDiameter = b.d[int(k)]/1.5;
    }
    x[0] = 0;
    y[0] = 0;
    z[0] = 0;
    if (isTrunk) {
      beginningDiameter = 20;
      endingDiameter = 5;
    }
    d[0] = beginningDiameter;
    xoff = 1;
    yoff = 1;
    zoff = 1;
    for (int i = 1; i < arraySize; i++) {
      xoff += xScale;
      yoff += yScale;
      zoff += zScale;
      if (useZ == false) {
        x[i] = x[i-1] + random(3, noise(xoff)*30);
        z[i] = z[i-1] + random(-2, 2);
      }
      else {
        x[i] = x[i-1] + random(-2, 2);
        z[i] = z[i-1] + random(3, noise(zoff)*30);
      }
      if (isTrunk == false)  {
      y[i] = y[i-1] - random(noise(yoff)*15);
      }
      else {
        y[i] = y[i-1] - random(-3, 3);
      }
      d[i] = map(i, 0, arraySize-1, beginningDiameter, endingDiameter);
    }
  }

  void drawSquiggle() {
    for (int i = 0; i < arraySize - 1; i++) {
      line(x[i], y[i], z[i], x[i+1], y[i+1], z[i+1]);
    }
  }

  void drawShell() {
    float[] cirX = new float[numSides+1];
    float[] cirY = new float[numSides+1];
    float[] cirZ = new float[numSides+1];
    for (int i = 0; i < arraySize; i++) {

      for (int t = 0; t < numSides+1; t++) {
        cirX[t] = sin(t)*(d[i]/2);
        cirY[t] = cos(t)*(d[i]/2);
        cirZ[t] = sin(t)*(d[i]/2);

        if (i != 0) {
          if (t != 0) {
            if (useZ == false) {
              beginShape();
              vertex(x[i], y[i] + cirY[t], cirZ[t] + z[i]);
              vertex(x[i], y[i] + cirY[t-1], cirZ[t-1] + z[i]);
              vertex(x[i-1], y[i-1] + cirY[t-1], cirZ[t-1] + z[i-1]);
              vertex(x[i-1], y[i-1] + cirY[t], cirZ[t] + z[i-1]);
              endShape();
            }  
            else {
              beginShape();
              vertex(cirX[t] + x[i], y[i] + cirY[t], z[i]);
              vertex(cirX[t-1] + x[i], y[i] + cirY[t-1], z[i]);
              vertex(cirX[t-1] + x[i-1], y[i-1] + cirY[t-1], z[i-1]);
              vertex(cirX[t] + x[i-1], y[i-1] + cirY[t], z[i-1]);
              endShape();
            }
          }  
          else {
            if (useZ == false) {
              beginShape();
              vertex(x[i], y[i] + cirY[t], cirZ[t] + z[i]);
              vertex(x[i], y[i] + cirY[cirY.length-1], cirZ[cirZ.length-1] + z[i]);
              vertex(x[i-1], y[i-1] + cirY[cirY.length-1], cirZ[cirZ.length-1] + z[i-1]);
              vertex(x[i-1], y[i-1] + cirY[t], cirZ[t] + z[i-1]);
              endShape();
            }  
            else {
              beginShape();
              vertex(cirX[t] + x[i], y[i] + cirY[t], z[i]);
              vertex(cirX[cirX.length-1] + x[i], y[i] + cirY[cirY.length-1], z[i]);
              vertex(cirX[cirX.length-1] + x[i-1], y[i-1] + cirY[cirY.length-1], z[i-1]);
              vertex(cirX[t] + x[i-1], y[i-1] + cirY[t], z[i-1]);
              endShape();
            }
          }
        }
      }
    }
  }
}

