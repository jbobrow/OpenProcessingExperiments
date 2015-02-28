
int gap = 50;
int topRow = 140;
int middleRow = topRow + gap;
int bottomRow = topRow + 2*gap;
int left = 160;
int max = 10;
int blockSize = 4;

letter letterA = new letter(left + gap/2, middleRow, blockSize);
letter letterB = new letter(left + 5*gap, bottomRow, blockSize);
letter letterC = new letter(left + 3*gap, bottomRow, blockSize);
letter letterD = new letter(left + 5*gap/2, middleRow, blockSize);
letter letterE = new letter(left + 2*gap, topRow, blockSize);
letter letterF = new letter(left + 7*gap/2, middleRow, blockSize);
letter letterG = new letter(left + 9*gap/2, middleRow, blockSize);
letter letterH = new letter(left + 11*gap/2, middleRow, blockSize);
letter letterI = new letter(left + 7*gap, topRow, blockSize);
letter letterJ = new letter(left + 13*gap/2, middleRow, blockSize);
letter letterK = new letter(left + 15*gap/2, middleRow, blockSize);
letter letterL = new letter(left + 17*gap/2, middleRow, blockSize);
letter letterM = new letter(left + 7*gap, bottomRow, blockSize);
letter letterN = new letter(left + 6*gap, bottomRow, blockSize);
letter letterO = new letter(left + 8*gap, topRow, blockSize);
letter letterP = new letter(left + 9*gap, topRow, blockSize);
letter letterQ = new letter(left, topRow, blockSize);
letter letterR = new letter(left + 3*gap, topRow, blockSize);
letter letterS = new letter(left + 3*gap/2, middleRow, blockSize);
letter letterT = new letter(left + 4*gap, topRow, blockSize);
letter letterU = new letter(left + 6*gap, topRow, blockSize);
letter letterV = new letter(left + 4*gap, bottomRow, blockSize);
letter letterW = new letter(left + gap, topRow, blockSize);
letter letterX = new letter(left + 2*gap, bottomRow, blockSize);
letter letterY = new letter(left + 5*gap, topRow, blockSize);
letter letterZ = new letter(left + gap, bottomRow, blockSize);

void setup() {
  size(800, 400);
}

void draw() {
  background(0);
  letterA.drawA();
  letterB.drawB();
  letterC.drawC();
  letterD.drawD();
  letterE.drawE();
  letterF.drawF();
  letterG.drawG();
  letterH.drawH();
  letterI.drawI();
  letterJ.drawJ();
  letterK.drawK();
  letterL.drawL();
  letterM.drawM();
  letterN.drawN();
  letterO.drawO();
  letterP.drawP();
  letterQ.drawQ();
  letterR.drawR();
  letterS.drawS();
  letterT.drawT();
  letterU.drawU();
  letterV.drawV();
  letterW.drawW();
  letterX.drawX();
  letterY.drawY();
  letterZ.drawZ();
}
class letter {
  float x, y, s;
  
  letter(float x, float y, float s) {
    this.x = x;
    this.y = y;
    this.s = s;
  }
  
  void drawA() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
  }
  
  void drawB() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y, s, s);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + s, y + 2*s, s, s);
  }
  
  void drawC() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
  }
  
  void drawD() {
    strokeWeight(1);
    stroke(0);
    fill(255);
//    rect(x, y, s, s);
    rect(x + 4*s, y, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
  }
  
  void drawE() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
  }
  
  void drawF() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + 2*s, y, s, s);
    rect(x + 3*s, y, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + s, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
  }
  
  void drawG() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y, s, s);
    rect(x + 2*s, y, s, s);
    rect(x + 3*s, y, s, s);
    rect(x + 4*s, y, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
  }
  
  void drawH() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y, s, s);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
  }
  
  void drawI() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + 2*s, y, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 2*s, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
  }
  
  void drawJ() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + 2*s, y, s, s);
    rect(x + 3*s, y, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + 3*s, y + 4*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 4*s, s, s);
//    rect(x, y + 5*s, s, s);
  }
  
  void drawK() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y, s, s);
    rect(x + s, y, s, s);
    rect(x + s, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 3*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
  }
  
  void drawL() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y, s, s);
    rect(x + 2*s, y, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 2*s, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
  }
  
  void drawM() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
  }
  
  void drawN() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
  }
  
  void drawO() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 2*s, s, s);
  }
  
  void drawP() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y, s, s);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y, s, s);
    rect(x + 2*s, y, s, s);
    rect(x + 3*s, y, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + s, y + 3*s, s, s);
  }
  
  void drawQ() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + s, y, s, s);
    rect(x + 2*s, y, s, s);
    rect(x + 3*s, y, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + 3*s, y + 4*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
  }
  
  void drawR() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
  }
  
  void drawS() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x + 4*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + s, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 5*s, s, s);
  }
  
  void drawT() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x + s, y, s, s);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
  }
  
  void drawU() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 4*s, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
  }
  
  void drawV() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x + s, y + 3*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 4*s, s, s);
    rect(x + 3*s, y + 3*s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + s, s, s);
  }
  
  void drawW() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x, y + 2*s, s, s);
    rect(x, y + 3*s, s, s);
    rect(x, y + 4*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 4*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + s, s, s);
  }
  
  void drawX() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + 3*s, y + 4*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 4*s, y + s, s, s);
  }
  
  void drawY() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y, s, s);
    rect(x, y + s, s, s);
    rect(x + s, y + 2*s, s, s);
    rect(x + 2*s, y + 2*s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 4*s, y, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 4*s, y + 2*s, s, s);
    rect(x + 4*s, y + 3*s, s, s);
    rect(x + 4*s, y + 4*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x, y + 4*s, s, s);
  }
  
  void drawZ() {
    strokeWeight(1);
    stroke(0);
    fill(255);
    rect(x, y + s, s, s);
    rect(x + s, y + s, s, s);
    rect(x + 2*s, y + s, s, s);
    rect(x + 3*s, y + s, s, s);
    rect(x + 4*s, y + s, s, s);
    rect(x + 3*s, y + 2*s, s, s);
    rect(x + 2*s, y + 3*s, s, s);
    rect(x + s, y + 4*s, s, s);
    rect(x, y + 5*s, s, s);
    rect(x + s, y + 5*s, s, s);
    rect(x + 2*s, y + 5*s, s, s);
    rect(x + 3*s, y + 5*s, s, s);
    rect(x + 4*s, y + 5*s, s, s);
  }
}
void keyTyped() {
  if (key == 'a' || key == 'A') {
    if (letterA.s < max) {
      letterA.x -= 5;
      letterA.y -= 6;
      letterA.s += 2;
    } else {
      letterA.x = left + gap/2;
      letterA.y = middleRow;
      letterA.s = 4;
    }
  }
  
  else if (key == 'b' || key == 'B') {
    if (letterB.s < max) {
      letterB.x -= 5;
      letterB.y -= 6;
      letterB.s += 2;
    } else {
      letterB.x = left + 5*gap;
      letterB.y = bottomRow;
      letterB.s = 4;
    }
  }
  
  else if (key == 'c' || key == 'C') {
    if (letterC.s < max) {
      letterC.x -= 5;
      letterC.y -= 6;
      letterC.s += 2;
    } else {
      letterC.x = left + 3*gap;
      letterC.y = bottomRow;
      letterC.s = 4;
    }
  }
  
  else if (key == 'd' || key == 'D') {
    if (letterD.s < max) {
      letterD.x -= 5;
      letterD.y -= 6;
      letterD.s += 2;
    } else {
      letterD.x = left + 5*gap/2;
      letterD.y = middleRow;
      letterD.s = 4;
    }
  }
  
  else if (key == 'e' || key == 'E') {
    if (letterE.s < max) {
      letterE.x -= 5;
      letterE.y -= 6;
      letterE.s += 2;
    } else {
      letterE.x = left + 2*gap;
      letterE.y = topRow;
      letterE.s = 4;
    }
  }
  
  else if (key == 'f' || key == 'F') {
    if (letterF.s < max) {
      letterF.x -= 5;
      letterF.y -= 6;
      letterF.s += 2;
    } else {
      letterF.x = left + 7*gap/2;
      letterF.y = middleRow;
      letterF.s = 4;
    }
  }
  
  else if (key == 'g' || key == 'G') {
    if (letterG.s < max) {
      letterG.x -= 5;
      letterG.y -= 6;
      letterG.s += 2;
    } else {
      letterG.x = left + 9*gap/2;
      letterG.y = middleRow;
      letterG.s = 4;
    }
  }
  
  else if (key == 'h' || key == 'H') {
    if (letterH.s < max) {
      letterH.x -= 5;
      letterH.y -= 6;
      letterH.s += 2;
    } else {
      letterH.x = left + 11*gap/2;
      letterH.y = middleRow;
      letterH.s = 4;
    }
  }
  
  else if (key == 'i' || key == 'I') {
    if (letterI.s < max) {
      letterI.x -= 5;
      letterI.y -= 6;
      letterI.s += 2;
    } else {
      letterI.x = left + 7*gap;
      letterI.y = topRow;
      letterI.s = 4;
    }
  }
  
  else if (key == 'j' || key == 'J') {
    if (letterJ.s < max) {
      letterJ.x -= 5;
      letterJ.y -= 6;
      letterJ.s += 2;
    } else {
      letterJ.x = left + 13*gap/2;
      letterJ.y = middleRow;
      letterJ.s = 4;
    }
  }
  
  else if (key == 'k' || key == 'K') {
    if (letterK.s < max) {
      letterK.x -= 5;
      letterK.y -= 6;
      letterK.s += 2;
    } else {
      letterK.x = left + 15*gap/2;
      letterK.y = middleRow;
      letterK.s = 4;
    }
  }
  
  else if (key == 'l' || key == 'L') {
    if (letterL.s < max) {
      letterL.x -= 5;
      letterL.y -= 6;
      letterL.s += 2;
    } else {
      letterL.x = left + 17*gap/2;
      letterL.y = middleRow;
      letterL.s = 4;
    }
  }
  
  else if (key == 'm' || key == 'M') {
    if (letterM.s < max) {
      letterM.x -= 5;
      letterM.y -= 6;
      letterM.s += 2;
    } else {
      letterM.x = left + 7*gap;
      letterM.y = bottomRow;
      letterM.s = 4;
    }
  }
  
  else if (key == 'n' || key == 'N') {
    if (letterN.s < max) {
      letterN.x -= 5;
      letterN.y -= 6;
      letterN.s += 2;
    } else {
      letterN.x = left + 6*gap;
      letterN.y = bottomRow;
      letterN.s = 4;
    }
  }
  
  else if (key == 'o' || key == 'O') {
    if (letterO.s < max) {
      letterO.x -= 5;
      letterO.y -= 6;
      letterO.s += 2;
    } else {
      letterO.x = left + 8*gap;
      letterO.y = topRow;
      letterO.s = 4;
    }
  }
  
  else if (key == 'p' || key == 'P') {
    if (letterP.s < max) {
      letterP.x -= 5;
      letterP.y -= 6;
      letterP.s += 2;
    } else {
      letterP.x = left + 9*gap;
      letterP.y = topRow;
      letterP.s = 4;
    }
  }
  
  else if (key == 'q' || key == 'Q') {
    if (letterQ.s < max) {
      letterQ.x -= 5;
      letterQ.y -= 6;
      letterQ.s += 2;
    } else {
      letterQ.x = left;
      letterQ.y = topRow;
      letterQ.s = 4;
    }
  }
  
  else if (key == 'r' || key == 'R') {
    if (letterR.s < max) {
      letterR.x -= 5;
      letterR.y -= 6;
      letterR.s += 2;
    } else {
      letterR.x = left + 3*gap;
      letterR.y = topRow;
      letterR.s = 4;
    }
  }
  
  else if (key == 's' || key == 'S') {
    if (letterS.s < max) {
      letterS.x -= 5;
      letterS.y -= 6;
      letterS.s += 2;
    } else {
      letterS.x = left + 3*gap/2;
      letterS.y = middleRow;
      letterS.s = 4;
    }
  }
  
  else if (key == 't' || key == 'T') {
    if (letterT.s < max) {
      letterT.x -= 5;
      letterT.y -= 6;
      letterT.s += 2;
    } else {
      letterT.x = left + 4*gap;
      letterT.y = topRow;
      letterT.s = 4;
    }
  }
  
  else if (key == 'u' || key == 'U') {
    if (letterU.s < max) {
      letterU.x -= 5;
      letterU.y -= 6;
      letterU.s += 2;
    } else {
      letterU.x = left + 6*gap;
      letterU.y = topRow;
      letterU.s = 4;
    }
  }
  
  else if (key == 'v' || key == 'V') {
    if (letterV.s < max) {
      letterV.x -= 5;
      letterV.y -= 6;
      letterV.s += 2;
    } else {
      letterV.x = left + 4*gap;
      letterV.y = bottomRow;
      letterV.s = 4;
    }
  }
  
  else if (key == 'w' || key == 'W') {
    if (letterW.s < max) {
      letterW.x -= 5;
      letterW.y -= 6;
      letterW.s += 2;
    } else {
      letterW.x = left + gap;
      letterW.y = topRow;
      letterW.s = 4;
    }
  }
  
  else if (key == 'x' || key == 'X') {
    if (letterX.s < max) {
      letterX.x -= 5;
      letterX.y -= 6;
      letterX.s += 2;
    } else {
      letterX.x = left + 2*gap;
      letterX.y = bottomRow;
      letterX.s = 4;
    }
  }
  
  else if (key == 'y' || key == 'Y') {
    if (letterY.s < max) {
      letterY.x -= 5;
      letterY.y -= 6;
      letterY.s += 2;
    } else {
      letterY.x = left + 5*gap;
      letterY.y = topRow;
      letterY.s = 4;
    }
  }
  
  else if (key == 'z' || key == 'Z') {
    if (letterZ.s < max) {
      letterZ.x -= 5;
      letterZ.y -= 6;
      letterZ.s += 2;
    } else {
      letterZ.x = left + gap;
      letterZ.y = bottomRow;
      letterZ.s = 4;
    }
  }
}


