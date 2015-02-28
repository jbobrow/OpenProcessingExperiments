
//homework 9
//Sharon Rubin
//srrubin@andrew.cmu.edu
//copyright © Sharon Rubin October 2012 Pittsburgh PA 15213 All Rights Reserved

int[] intArray = new int[10];
int sum, avg, sumGreater;

void setup() {
  size(400, 400);
  background(255);
  for (int i = 0; i < 10; i++) {
    intArray [i] = int(random(0, width));
  } 
  textSize(15);
//  PFont font;
//  font = loadFont("Neou-Thin.vlw");
//  textFont(font, 15);
  smooth();
  fill(80);
  textAlign(LEFT);
  text(intArray.length, width/2.5+180, height/2-40);
  sum = computeSum();
  text(sum, width/2.5+180, height/2-10);
  avg = computeAvg();
  text(avg, width/2.5+180, height/2+20);
  sumGreater = computeSumGreater();
  text(sumGreater, width/2.5+180, height/2+50);

  textAlign(RIGHT);
  text("LENGTH : ", width/2.5+175, height/2-40);
  text("SUM : ", width/2.5+175, height/2-10);
  text("AVERAGE : ", width/2.5+175, height/2+20);
  text("SUM OF VALUES GREATER THAN AVERAGE : ", width/2.5+175, height/2+50);
}

int computeSum() {
  for (int i=0; i<intArray.length; i++) {
    sum += intArray[i];
  }
  return sum;
}

int computeAvg() {
  for (int i=0; i<intArray.length; i++) {
    avg = sum/intArray.length;
  }
  return avg;
}

int computeSumGreater() {
  for (int i=0; i<intArray.length; i++) {
    if (intArray[i]>avg) {
      sumGreater += intArray[i];
    }
  }
  return sumGreater;
}


