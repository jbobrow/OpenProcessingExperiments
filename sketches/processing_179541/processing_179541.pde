
int wait = 100;
int indexI, indexJ, numPoints;
float centX, centY;
PVector[] pointArr;
boolean firstPass = true;
boolean setMult = false;

void setup() {  
  size(500, 500, P2D);
  noFill();
  smooth();  
  centX = width/2;
  centY = height/2;
  numPoints = (int) random(7,25);
  strokeWeight(1);
  definePoints();
}

void draw() {
  if (firstPass)
  {
    background(255);
    for (int i=0; i<pointArr.length; i++) {
      ellipse(pointArr[i].x, pointArr[i].y, 3, 3);
    }
    firstPass = false;
    setMult = true;
  } else {
    float a = pointArr[indexI].x;
    float b = pointArr[indexI].y;
    float c = pointArr[indexJ].x;
    float d = pointArr[indexJ].y;
    line(a, b, c, d);

    indexJ++;
    if (indexJ > numPoints - 1) {
      indexI ++;
      if (indexI > numPoints - 2) {
        noLoop();
      } else {
        indexJ = indexI+1;
      }
    }
    int now = millis();
    int mult =1;
    if (setMult) {
      mult = 10;
      setMult = false;
    }
    while ( millis () < now + wait*mult) {
    }
  }
}

void definePoints() {
  float radius = width/2 -40;
  float angle = 360/(float)numPoints;
  indexI = 0;
  indexJ = 1;
  pointArr = new PVector[numPoints];
  for (int i=0; i<numPoints; i++)
  {
    float x = centX + (radius * cos(radians(angle * i)));
    float y = centY + (radius * sin(radians(angle * i)));
    pointArr[i] = new PVector(x, y);
  }
}

void mousePressed() {
  numPoints = (int) random(7,25);
  definePoints();
  firstPass = true;
  loop();
}


