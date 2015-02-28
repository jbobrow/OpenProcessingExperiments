
/*********************************
* Bubble Clock Demo              *
* Made by Camaris                *
* Also available as Android App  *
**********************************/

PImage tB;
float timeH, timeM, timeS, prevTimeS;
float baseW, baseH, scaledW, scaledH, scaleFactorW, scaleFactorH, bubbleScaleFactor;
int nNumbers=8;
Number[] nList=new Number[nNumbers];

public void setup() {
  size(600, 400);
  frameRate(30);
  tB=loadImage("bubble3_50x50.png");
  //	orientation(LANDSCAPE);  // the hot dog way
  frameRate(25);
  smooth();

  baseW=1150;
  baseH=400;

  scaledW=max(width, height);
  scaledH=min(width, height);

  scaleFactorW=scaledW/baseW;
  scaleFactorH=scaledH/baseH;
  ;

  bubbleScaleFactor=min(scaleFactorW, scaleFactorH);

  timeH=hour();
  timeM=minute();
  timeS=second();

  nList[0]=new Number(0, scaleFactorW*50, scaleFactorH*250, scaleFactorW*100, scaleFactorH*100, bubbleScaleFactor);
  nList[1]=new Number(0, scaleFactorW*200, scaleFactorH*250, scaleFactorW*100, scaleFactorH*100, bubbleScaleFactor);
  nList[2]=new Number(11, scaleFactorW*365, scaleFactorH*250, scaleFactorW*50, scaleFactorH*100, bubbleScaleFactor);
  nList[3]=new Number(0, scaleFactorW*450, scaleFactorH*250, scaleFactorW*100, scaleFactorH*100, bubbleScaleFactor);
  nList[4]=new Number(0, scaleFactorW*600, scaleFactorH*250, scaleFactorW*100, scaleFactorH*100, bubbleScaleFactor);
  nList[5]=new Number(11, scaleFactorW*765, scaleFactorH*250, scaleFactorW*50, scaleFactorH*100, bubbleScaleFactor);
  nList[6]=new Number(0, scaleFactorW*850, scaleFactorH*275, scaleFactorW*75, scaleFactorH*75, bubbleScaleFactor);
  nList[7]=new Number(0, scaleFactorW*1000, scaleFactorH*275, scaleFactorW*75, scaleFactorH*75, bubbleScaleFactor);
}

public void draw() {
  fill(0, 0, 0, 150);
  rect(0, 0, width, height);
  if (timeS!=second()) {
    timeH=hour();
    timeM=minute();
    timeS=second();
    timeChanged(0, (int)(timeH/10));
    timeChanged(1, (int)(timeH%10));
    timeChanged(2, 11);
    timeChanged(3, (int)(timeM/10));
    timeChanged(4, (int)(timeM%10));
    timeChanged(5, 11);
    timeChanged(6, (int)(timeS/10));
    timeChanged(7, 5*(int)((timeS%10)/5));
  }

  for (int j=0;j<nNumbers;j++) {
    nList[j].step();
    for (int i=0;i<nList[j].nSegments;i++) {
      //nList[j].sList[i].step();
      for (int k=0;k<nList[j].sList[i].nBubbles;k++) {
        if (nList[j].sList[i].bList[k].state != "gone") image(tB, nList[j].sList[i].bList[k].px-nList[j].sList[i].bList[k].bsize/2, nList[j].sList[i].bList[k].py-nList[j].sList[i].bList[k].bsize/2, nList[j].sList[i].bList[k].bsize, nList[j].sList[i].bList[k].bsize);
      }
    }
  }
}

void timeChanged(int tIndex, int tNumber) {
  int index=tIndex;
  int index2=tNumber;
  for (int i=0; i<7; i++) {
    if (nList[index].numbers[index2][i]==1) {
      if (!nList[index].sList[i].active) nList[index].sList[i].toggle();
    } 
    else {
      if (nList[index].sList[i].active) nList[index].sList[i].toggle();
    }
  }
}


