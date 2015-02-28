
PImage img;
color[][] imgPixels;

int startingRow=0;

int traceSquareX=0;
int traceSquareY=0;
int traceSquareSize=2;

int originalX=0;
int originalY=0;

ArrayList<myPoint> allPoints = new ArrayList<myPoint>();

boolean doneTracing=false;

int img285=284;
int img400=200;


void setup() {
  img=loadImage("betterMario.png");
  size(401, 285);

  imgPixels=new color[img400+1][img285+1];
  img.loadPixels();
  for (int i=0;i<imgPixels.length;i++) {
    for (int j=0;j<imgPixels[i].length;j++) {
      int loc=i+j*(imgPixels.length-1);
      if (i==img400 || j==img285) {
        imgPixels[i][j]=color(255);
      }
      else {
        imgPixels[i][j]=img.pixels[loc];
      }
    }
  }

  for (int j=0;j<imgPixels[0].length;j++) {
    boolean foundColor=false;
    for (int i=0;i<imgPixels.length;i++) {
      if (imgPixels[i][j]!=color(255)) {
        foundColor=true;
      }
    }
    if (foundColor) {
      startingRow=j;
      break;
    }
  }
  for (int i=0;i<imgPixels.length;i++) {
    if (imgPixels[i][startingRow]!=color(255)) {
      traceSquareX=i;
      break;
    }
  }
  traceSquareY=startingRow-1;

  originalX=traceSquareX;
  originalY=traceSquareY;

  size(400, 285);
}

void draw() {
  //  scale(1);
  background(255);

  if (traceSquareX==originalX && traceSquareY==originalY && !allPoints.isEmpty()) {
    doneTracing=true;
  }

  if (!doneTracing) {
    strokeWeight(1);
    for (int i=0;i<imgPixels.length;i++) {
      for (int j=0;j<imgPixels[i].length;j++) {
        color c = imgPixels[i][j];
        fill(c);
        stroke(c);
        pushMatrix();
        translate(i+1, j+1);
        rect(0, 0, 1, 1);
        popMatrix();
      }
    }
  }

  //draw outline
  stroke(255, 0, 0);
  noFill();
  strokeWeight(2);
  beginShape();
  for (int i=0;i<allPoints.size();i++) {
    vertex(allPoints.get(i).x, allPoints.get(i).y);
  }
  endShape();

  if (!doneTracing) {
    boolean topLeftWhite=false;
    boolean topRightWhite=false;
    boolean bottomLeftWhite=false;
    boolean bottomRightWhite=false;
    if (imgPixels[traceSquareX][traceSquareY]==color(255)) {
      topLeftWhite=true;
    }
    if (imgPixels[traceSquareX+1][traceSquareY]==color(255)) {
      topRightWhite=true;
    }
    if (imgPixels[traceSquareX][traceSquareY+1]==color(255)) {
      bottomLeftWhite=true;
    }
    if (imgPixels[traceSquareX+1][traceSquareY+1]==color(255)) {
      bottomRightWhite=true;
    }

    if (topLeftWhite && topRightWhite && bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 1");
      traceSquareX++;
    }
    if (topLeftWhite && !topRightWhite && bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 2");
      allPoints.add(new myPoint(traceSquareX+2, traceSquareY+1));
      traceSquareX++;
    }
    if (topLeftWhite && !topRightWhite && bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 3");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY+2));
      traceSquareY++;
    }
    if (topLeftWhite && topRightWhite && bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 4");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY+2));
      traceSquareY++;
    }
    if (!topLeftWhite && !topRightWhite && bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 5");
      allPoints.add(new myPoint(traceSquareX+2, traceSquareY+1));
      traceSquareX++;
    }
    if (!topLeftWhite && topRightWhite && bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 6");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY));
      traceSquareY--;
    }
    if (!topLeftWhite && topRightWhite && !bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 7");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY));
      traceSquareY--;
    }
    if (topLeftWhite && topRightWhite && !bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 8");
      allPoints.add(new myPoint(traceSquareX, traceSquareY+1));
      traceSquareX--;
    }
    if (topLeftWhite && topRightWhite && !bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 9");
      allPoints.add(new myPoint(traceSquareX, traceSquareY+1));
      traceSquareX--;
    }
    if (!topLeftWhite && topRightWhite && !bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 10");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY));
      traceSquareY--;
    }
    if (topLeftWhite && !topRightWhite && !bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 11");
      allPoints.add(new myPoint(traceSquareX, traceSquareY+1));
      traceSquareX--;
    }
    if (!topLeftWhite && !topRightWhite && bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 12");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY+2));
      traceSquareY++;
    }
    if (!topLeftWhite && !topRightWhite && !bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 13");
      allPoints.add(new myPoint(traceSquareX+2, traceSquareY+1));
      traceSquareX++;
    }
    if (!topLeftWhite && topRightWhite && bottomLeftWhite && !bottomRightWhite) {
      //    println("Situation 14");
      allPoints.add(new myPoint(traceSquareX+1, traceSquareY));
      traceSquareY--;
    }
    if (topLeftWhite && !topRightWhite && !bottomLeftWhite && bottomRightWhite) {
      //    println("Situation 15");
      allPoints.add(new myPoint(traceSquareX, traceSquareY+1));
      traceSquareX--;
    }
    if (!topLeftWhite && !topRightWhite && !bottomLeftWhite && !bottomRightWhite) {
      //    println("Problem");
    }

    noFill();
    stroke(0, 255, 0);
    strokeWeight(.1);
    rect(traceSquareX, traceSquareY, traceSquareSize, traceSquareSize);

    rectMode(CENTER);
    strokeWeight(5);
    rect(400-100, 285/2, 100, 100);

    noStroke();
    fill(imgPixels[traceSquareX][traceSquareY]);
    rect(400-125, 285/2-25, 50, 50);

    fill(imgPixels[traceSquareX+1][traceSquareY]);
    rect(400-75, 285/2-25, 50, 50);

    fill(imgPixels[traceSquareX][traceSquareY+1]);
    rect(400-125, 285/2+25, 50, 50);

    fill(imgPixels[traceSquareX+1][traceSquareY+1]);
    rect(400-75, 285/2+25, 50, 50);
  }
}


class myPoint {

  int x;
  int y;

  myPoint(int a, int b) {
    x=a;
    y=b;
  }
}


