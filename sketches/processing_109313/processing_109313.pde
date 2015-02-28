
int randColor = 9;
int canvasX = 1366;
int canvasY = 720;
float lastX = 0; //X coord of previous vertical line
float lastY = 0; //Y coord of previous horizontal line
float squareLeftX = 0; //lastX
float w = 0;
float lastW = 0; // width of previous square

//rect that goes through columns is (random(, squareAboveY)
//rect that goes through left rect is (

void setup() {
  size(1366, 720);
  strokeWeight(6);
}

void randFill() { //randomize colors
  randColor = int(random(0, 9));
  if (randColor == 0) {
    fill(0, 0, 0);
  }
  else if (randColor == 1) {
    fill(255, 0, 0);
  }
  else if (randColor == 2) {
    fill(255, 255, 0);
  }
  else if (randColor == 3) {
    fill(0, 0, 255);
  }
  else {
    fill(255, 255, 255);
  }
}

//void verticalSplit(w, firstL, lastY, squareLeftX) {
//  int randRect = int(random(4))
//  if (randRect == 0) {
//    rect(0, 0, w, random(20, firstL)); //create another rect in current rect
//  }
//  else if (randRect == 1) {
//    rect(-squareLeftX, 0, w+squareLeftX, random(20, firstL)); //create rect into left rect
//  }
//  else if (randRect == 2) {
//    rect(0, -lastY, random(20, w), firstL+lastY);
//  }
//}

void draw() {
  while (lastY < canvasY) {
    float firstW = random(20, 180); //first rectangle in col width
    float firstL = random(20, 300); //first rectangle in col length
    while (lastX < canvasX) {
      pushMatrix();
      w = random(20, 180); //current rectangle width
      translate(lastX, lastY);
      randFill();
      rect(0, 0, w, firstL);
      int randRect = int(random(4));
      if (randRect == 0) {
        rect(0, 0, w, random(20, firstL)); //create another rect in current rect
      }
      else if (randRect == 1) {
        rect(-lastW, 0, lastW+w, random(20, firstL)); //create rect into left rect
        noFill();
        rect(-lastW, 0, lastW+w, firstL); // blocking off
      }
      //      else if (randRect == 2) {
      //        rect(0, -lastY, random(20, w), firstL+lastY); // create rect 
      //      }
      lastW = w; // width of previous square
      lastX += w;
      popMatrix();
    }
    randFill();
    rect(0, lastY, firstW, firstL);
    lastX = 0;
    lastY += firstL;
  }

  noFill();
  rect(0, 0, canvasX, canvasY);
}



