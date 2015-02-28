

class Bubble {

  int BubbleNum;
  float BubbleSize[];
  float BubblePosX[];
  float BubblePosX0[];
  float BubblePosY[];
  float BubbleSpeedY[];
  float BubbleAccY[];
  float BubbleAmp[];
  float BubbleTheta[];
  float BubbleSpeedTheta[];
  color BubbleColor[];

  Bubble(int tempNum) {

    BubbleNum = tempNum;
    BubbleSize = new float[BubbleNum];
    BubblePosX = new float[BubbleNum];
    BubblePosX0 = new float[BubbleNum];
    BubblePosY = new float[BubbleNum];
    BubbleSpeedY = new float[BubbleNum];
    BubbleAccY = new float[BubbleNum];
    BubbleAmp = new float[BubbleNum];
    BubbleTheta = new float[BubbleNum];
    BubbleSpeedTheta = new float[BubbleNum];
    BubbleColor = new color[BubbleNum];

    for(int i=0; i<BubbleNum; i++) {
      BubbleSize[i] = random(10,30);
      BubblePosX0[i] = random(width);
      BubblePosY[i] = height;
      BubbleSpeedY[i] = random(.01,1);
      BubbleAccY[i] = random(.001,.01);
      BubbleAmp[i] = random(1,20);
      BubbleTheta[i] = 0;
      BubbleSpeedTheta[i] = random(1,10);
      BubbleColor[i] = color(0,0,random(50,100),random(50));

    }



  }


  void calcBubbles(int i) {
    BubblePosX[i] = BubblePosX0[i] + BubbleAmp[i] * sin(radians(BubbleTheta[i]));
    if(BubbleTheta[i] > 360) {
      BubbleTheta[i] = 0;
    }
    BubbleTheta[i]+=BubbleSpeedTheta[i];

    BubbleSpeedY[i] += BubbleAccY[i];
    BubblePosY[i] -= BubbleSpeedY[i];
    if(BubblePosY[i] < 0) { 
      BubbleSize[i] = random(10,30);
      BubblePosX0[i] = random(width);
      BubblePosY[i] = height;
      BubbleSpeedY[i] = random(.01,1);
      BubbleAccY[i] = random(.001,.01);

      BubbleAmp[i] = random(1,20);
      BubbleSpeedTheta[i] = random(1,10);
      BubbleColor[i] = color(0,0,random(50,100),random(50));

    }

  }


  void displayBubbles(int i) {
    setBubblesColor(i);
    ellipse(BubblePosX[i], BubblePosY[i], BubbleSize[i], BubbleSize[i]);
  }

  void setBubblesColor(int i) {

    if(i % 2 == 0) {
      noStroke();
      fill(BubbleColor[i]);
    } 
    else {
      stroke(BubbleColor[i]);
      noFill();  
    }

  }


}






