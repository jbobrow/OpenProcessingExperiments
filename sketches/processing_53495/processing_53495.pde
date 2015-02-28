
float[][] myValue;
int dataQty, itemQty;
float easingQt,reBarHeight;
boolean boolDimmed;
float[] minim;
float[] maxim;
float netMinim, netMaxim, myMin, myMax, targetMin, targetMax;
float[] holdValue;
int loScreen, hiScreen, xStart, xEnd;
color[] myColor;
float margeN,loFix, hiFix;
float tempStep;

void setup() {
  size(800, 600);
  margeN=.080;
  loScreen=int(height*margeN);
  hiScreen=int(height*(1.0-margeN));
  xStart=int(width*margeN);
  xEnd=int(width*(1.0-margeN));
  loFix=0.93;
  hiFix=1.07;
  smooth();
  background(36);
  easingQt=0.0425;
  itemQty=6;
  myColor = new color[7];
  //  myColor[0]=#91D6BC;

  //#A6412B,#7E8A83,#A2ADA3,#D0DEC2,#8CA684
  myColor[0]=#A6412B;
  myColor[1]=#7E8A83;
  myColor[2]=#A2ADA3;
  myColor[5]=#A6412B;
  myColor[6]=#7E8A83;
  myColor[3]=#D0DEC2;
  myColor[4]=#8CA684;
  minim = new float[itemQty];
  maxim = new float[itemQty];
  
  String tempURL="http://ichart.finance.yahoo.com/table.csv?s=";
  String tempARG="&a=0&b=1&c=2011&g=d";

  doStockGrab(0, tempURL+"MSFT"+tempARG);
  doStockGrab(1, tempURL+"GE"+tempARG);
  doStockGrab(2, tempURL+"SBUX"+tempARG);
  doStockGrab(3, tempURL+"T"+tempARG);
  doStockGrab(4, tempURL+"WFM"+tempARG);
  doStockGrab(5, tempURL+"AXP"+tempARG);

  netMinim=min(minim)*.80; // not entirely clear on why I need to fix minim
  netMaxim=max(maxim); // but leave maxim alone, but that's What Works (R).
  myMin=netMinim;
  myMax=netMaxim;
  targetMin=myMin;
  targetMax=myMax;

  tempStep=(netMaxim-netMinim)/52;

}

void draw() {
  background(32);

  doGrid();

  for (int itemNumber=0;itemNumber<itemQty;itemNumber++) {
    doStockDraw(itemNumber, myMin*loFix, myMax*hiFix);
  }

  doFrame();

  if (reBarHeight<1.0) {
    reBarHeight=ezEaseUp(1.0, reBarHeight);
  }
  
  if (reBarHeight>0.9995 && reBarHeight<1.0) {
    reBarHeight=1.0;
  }

  if (myMin<targetMin) {
    myMin=ezEaseUp(targetMin, myMin);
  } else if (myMin>targetMin) {
    myMin=ezEaseDown(targetMin, myMin);
  }

  if (myMax<targetMax) {
    myMax=ezEaseUp(targetMax, myMax);
  } else if (myMax>targetMax) {
    myMax=ezEaseDown(targetMax, myMax);
  }

}

void doStockGrab(int itemNo, String myURL) {
  String dataLines[]=loadStrings(myURL);
  dataQty=dataLines.length-1;  // account for header!
  if (boolDimmed == false) {
    myValue=new float[itemQty][dataQty];
    holdValue=new float[dataQty];
    boolDimmed=true;
  }
  for (int i=0;i<dataQty;i++) {
    String[] temp = split(dataLines[i+1], ',');
    holdValue[i]=float(temp[4]);
  }
  minim[itemNo]=min(holdValue);
  maxim[itemNo]=max(holdValue);
  arrayCopy(reverse(holdValue), myValue[itemNo]);
}

void doStockDraw(int itemNo, float setMin, float setMax) {

  strokeWeight(3);
  stroke(myColor[itemNo]);

  for (int i=1;i<dataQty;i++) {
    float y1Temp = map(myValue[itemNo][i], setMin, setMax, loScreen, hiScreen);
    float y0Temp = map(myValue[itemNo][i-1], setMin, setMax, loScreen, hiScreen);
    y1Temp=constrain(height-(y1Temp*reBarHeight), loScreen, hiScreen);
    y0Temp=constrain(height-(y0Temp*reBarHeight), loScreen, hiScreen);
    float x1Temp = map(i, 0, dataQty-1, xStart, xEnd);
    float x0Temp = map(i-1, 0, dataQty-1, xStart, xEnd);
    if (mousePressed) {
      if (mouseX >= x0Temp && mouseX <= x1Temp) {
        noStroke();
        fill(255);
        ellipse((x0Temp+x1Temp)/2,(y0Temp+y1Temp)/2,6,6);
      }
    }
    line (x0Temp, y0Temp, x1Temp, y1Temp);
  }
}

void keyReleased() {

  if (key == '1') {
    targetMin=minim[1];
    targetMax=maxim[1];
  }
  if (key == '2') {
    targetMin=minim[2];
    targetMax=maxim[2];
  }
  if (key == '3') {
    targetMin=minim[3];
    targetMax=maxim[3];
  }
  if (key == '4') {
    targetMin=minim[4];
    targetMax=maxim[4];
  }  
  if (key == '0') {
    targetMin=minim[0];
    targetMax=maxim[0];
  }
  if (key == '5') {
    targetMin=minim[5];
    targetMax=maxim[5];
  }
  if (key == '6') {
    targetMin=netMinim;
    targetMax=netMaxim;
  }  
}

float ezEaseUp (float ezTarget, float ezCurrent) {
  return (ezCurrent+((ezTarget-ezCurrent)*easingQt));
}

float ezEaseDown (float ezTarget, float ezCurrent) {
  return (ezCurrent-((ezCurrent-ezTarget)*easingQt));
}

void doGrid() {
  strokeWeight(1);
  stroke(57);

  for (float j=netMinim;j<netMaxim;j=j+tempStep) {
    float mTemp=constrain(height-map(j, myMin*loFix, myMax*hiFix, loScreen, hiScreen),loScreen,hiScreen);
    line(xStart, mTemp, xEnd, mTemp);
  }
  if (mousePressed) {
    stroke(72);
    strokeWeight(3);
    int myMouse=constrain(mouseX, xStart, xEnd);
    line(myMouse, loScreen, myMouse, hiScreen);
  }
}

void doFrame() {
  strokeWeight(5);
  stroke(200);
  noFill();
  rect (xStart, loScreen, xEnd-xStart, hiScreen-loScreen);
}

