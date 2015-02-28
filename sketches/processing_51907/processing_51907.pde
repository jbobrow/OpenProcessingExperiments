
// t-1000
// mjmurdock 2012
// global variables

PShape ATandT0;

/////////////

float x, y;
float moveRate = 5;
float easing = .05;

int numberPieces = 41;

PShape[] ATandT = new PShape[numberPieces];
float[] targetX = new float[numberPieces];
float[] targetY = new float[numberPieces];
float[] startX = new float[numberPieces];
float[] startY = new float[numberPieces];
float[] assemblyTime = new float[numberPieces];
float[] startRot = new float[numberPieces];
float[] targetRot = new float[numberPieces];

float[] deltaX = new float[numberPieces];
float[] deltaY = new float[numberPieces];


void setup() {
  size(500, 500);
  background(100);
  smooth();
  x = width/2;
  y = height/2;

  // load 'da graphics
  ATandT0 = loadShape("ATandT.svg");


  // fill image array
  for (int i=0; i<ATandT.length; i++) {
    ATandT[i] = loadShape(i + ".svg");
  }


  noStroke();
  fill(255, 100);


  fillArrays();
  println(targetX);
}

void draw () {
  background(100);
  frameRate(30);


  if (mousePressed == true) {
    fillArrays();
    println(targetX);
  }

  translate(width/2, height/2);
  for (int i = 0; i<numberPieces; i++) {
    // ellipse(startX[i], startY[i], 30, 30);
  }
  drawPieces(0, 0);
}


// SPECIAL FUNCTIONS

void fillArrays() {
  for (int i = 0; i<numberPieces; i++) {
    targetX[i] = random(-width/2, width/2);
    targetY[i] = random(-height/2, height/2);
    startX[i] = 0;
    startY[i] = 0;
    assemblyTime[i] = random(.2, .8);
    targetRot[i] = random(180);
  }
}

// draws DA stuff
void drawPieces(float originX, float originY) {
  int[] remainderX = new int[numberPieces];
  int startS = second();
  int s = second();

  for (int i=0; i<numberPieces; i++) {

    // find distance between origin and target
    deltaX[i] = targetX[i] - startX[i];
    deltaY[i] = targetY[i] - startY[i];

    // easing
    deltaX[i] *= easing*assemblyTime[i];
    deltaY[i] *= easing*assemblyTime[i];

    // add easing to current location 
    startX[i] += deltaX[i];
    startY[i] += deltaY[i];

    //    if ((startX[i] - targetX[i]) < 1) {
    //      remainderX[i] = round(startX[i]);
    //      round(startY[i]);
    //      float(remainderX[i]);
    //      
    //    }
    rotate(radians(targetRot[i]));
    shape(ATandT[i], startX[i], startY[i]);
    
    //    ellipse(startX[i], startY[i], 30, 30);

    if ((startX[i] - targetX[i]) < .5 && (startY[i] - targetY[i]) < .5) {
      targetX[i] = 0.0;
      targetY[i] = 0.0;
    }
    
    
    

      if (targetRot[i] != 0 && millis() > 3000) {
        targetRot[i] -= targetRot[i] * easing;
        println(targetRot[1]);
        if (targetRot[i] < 0) {
          targetRot[i] = 0;
        }
      }


    stroke(200);
    strokeWeight(2);
    //    line(0,0,startX[i], startY[i]);
  }
}


