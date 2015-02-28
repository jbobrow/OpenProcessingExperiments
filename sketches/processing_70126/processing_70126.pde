
class Drop {
  float myX;
  float myY;
  float[][] miniXY =  new float[20][2];
  float[] miniSize = new float[20];
  float[] myColor = new float[3];
  float myAlpha = 0.0;
  float mySize = 10.0;

  Drop(float dropX,float dropY) {
    myX = dropX;
    myY = dropY;
    ////////XYpoint of little Drop
    for (int i = 0; i<20 ; i++) {
      for (int j = 0; j <2 ; j++) {
        miniXY[i][j] = random(-70, 70);
      }
    }
    ////////Size of little Drop
    for (int k=0;k<20;k++) {
      miniSize[k] = random(2, 40);
    }

    ////////color of little Drop
    for (int n = 0 ; n<3;n++) {
      myColor[n] = random(0.0, 255.0);
    }
  }
  void startDrop() {
    myAlpha++;
    mySize-=2;
    //////little drops
    fill(myColor[0], myColor[1], myColor[2], 100 - myAlpha);

    for (int l = 0 ;l<20;l++) {
      ellipse(myX + miniXY[l][0], myY+ miniXY[l][1], miniSize[l] + mySize, miniSize[l]+ mySize);
    } 
  }
}

