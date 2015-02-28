
/* OpenProcessing Tweak of *@*http://www.openprocessing.org/sketch/132087*@* */
/* !do not delete the line above, required for linking your tweak if you upload again */
float checkDist(PVector a, PVector b) {
  float tempX, tempY, distOut;

  tempX = a.x - b.x;
  tempY = a.y - b.y;

  tempX = pow(tempX, 2);
  tempY = pow(tempY, 2);

  distOut = tempX + tempY;
  return sqrt(distOut);
}

//Get slope as normalized vector
PVector slope(PVector a, PVector b) {
  //a is CircCenter
  //b is MousePos

  PVector tempVec = PVector.sub(b, a);
  tempVec.normalize();

  return tempVec;
}

boolean first = true;
public class Rect {
  float x, y, rWidth, rHeight;
  float r;
  boolean on, full, shrinking = false;
  int onTime = 150;
  int count = 0;
  public Rect(float x_, float y_, float width_, float height_, float r_) {
    x = x_;
    y = y_;
    rWidth = width_;
    rHeight = height_;
    r = r_;
  }

  void drawR() {
    if (on) {
      if (!full) {
        if (rHeight < 20) {
          rWidth += 6;
          rHeight +=2;
        }
        else if (rWidth < 40) {
          rWidth += 6;
          rHeight += 6;
        }
        else {
          rWidth += 10;
          rHeight += 15;
        }
        rect(x, y, rWidth, rHeight, r);
        if (rWidth>80) {
          rWidth = 80;
          rHeight = 80;
          full = true;
        }
      }
      else {
        fill(40, 155, 88);
        stroke(82, 187, 117);
        strokeWeight(2);

        //Green bg
        rect(x, y, rWidth, rHeight, r);

        fill(255);
        noStroke();
        if(!shrinking){
        //Eyes
        //rect(x-15,y-15,11,10);
        //rect(x+15,y-15,10,15);
        drawEyes();

        //Mouth
        rect(x-15.4, y+17, 10, 10);
        rect(x, y+22, 40, 10);
        rect(x+15, y+17, 10, 10);
        }

        count ++;

        if (count > onTime) {
          shrinking = true;
        println(rWidth+ " "+rHeight);
          if (rHeight>20) {
            rWidth -= 5;
            rHeight -= 10;
          }
          else if (rWidth > 2 && rHeight >= 2) {
            rWidth -= 1;
            rHeight -= 1;
          }
          else if (rWidth < 2 || rHeight < 2) {

            rWidth = 1;
            rHeight = 1;

            count = 0;
            on = false; 
            full = false;
            shrinking = false;
          }
        }
      }
    }
  }

  void drawEyes() {
    float circumfrence = 20;
    PVector mouseVec = new PVector(mouseX, mouseY);


    //Center point for eyes
    PVector lEye = new PVector(x - 15, y - 15);
    PVector rEye = new PVector(x + 15, y - 15);

    //PVector to draw actual eye pos
    PVector lPup, rPup;

    /*
    if (checkDist(eyeVec, mouseVec)< circumfrence/2) {
     pupil.x = mouseX;
     pupil.y = mouseY;
     }*/

    //Left eye follow
    if (checkDist(lEye, mouseVec) < circumfrence/2) {
      lPup = new PVector(mouseX, mouseY);
    }
    else {
      PVector tempVecL  = slope(lEye, mouseVec);
      tempVecL.mult(circumfrence/2);
      tempVecL = PVector.add(lEye, tempVecL);
      lPup = new PVector(tempVecL.x, tempVecL.y);
    }


    //Right eye follow
    if (checkDist(rEye, mouseVec) < circumfrence/2) {
      rPup = new PVector(mouseX, mouseY);
    }
    else {
      PVector tempVecR = slope(rEye, mouseVec);
      tempVecR.mult(circumfrence/2);
      tempVecR = PVector.add(rEye, tempVecR);
      rPup = new PVector(tempVecR.x, tempVecR.y);
    }



    rect(lPup.x, lPup.y, 11, 10);
    rect(rPup.x, rPup.y, 10, 15);
  }
}

Rect[][] tvs = new Rect[5][5];

void setup() {
  rectMode(CENTER);
  size(500, 500);
  fill(12, 11, 13);
  stroke(40, 47, 55);
  strokeWeight(8);

  fill(40, 155, 88);
  stroke(82, 187, 117);
  strokeWeight(2);
  for (float x = 0; x< 5; x++) {
    for (float y =  0; y < 5; y++) {
      tvs[int(x)][int(y)] = new Rect(x*100+40 + 10, y*100 +40 + 10, 1, 1, 7);
    }
  }
}
void checkMPos() {
  int tX, tY;
  tX = int(mouseX/100);
  tY = int(mouseY/100);
  if (tvs[tX][tY].on) {
    tvs[tX][tY].count = 0;
  }
  else {
    tvs[tX][tY].on = true;
  }
}

void draw() {

  for (float x = 0; x< 5; x++) {
    for (float y =  0; y < 5; y++) {
      fill(12, 11, 13);
      stroke(40, 47, 55);
      strokeWeight(8);
      rect(x*100+50, y*100+50, 100, 100);
    }
  }
  checkMPos();

  for (int x = 0; x< 5; x++) {
    for (int y =  0; y < 5; y++) {
      fill(40, 155, 88);
      stroke(82, 187, 117);
      strokeWeight(2);
      tvs[x][y].drawR();
    }
  }
}




// 40,155,88

