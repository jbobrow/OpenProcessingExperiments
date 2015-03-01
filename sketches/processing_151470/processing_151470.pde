
import processing.opengl.*;

boolean miden, smoothFade;
boolean xar=true;

float amp1, freq1, amp2, freq2, ampout, freqout;
float ElegxosAmp;

SketchLine  line0, line1, line2;
float x1, y1, x2, y2; 
PImage cur;

int stoixeia = 30, lineAlpha = 50;

int colorL=255,strokeL, strokeValue = 20, strokeBackground = 5;
int paintCount = 0, alphaSform;
int r0,g0,b0,r1,g1,b1;

float[] x = new float[stoixeia];
float[] y = new float[stoixeia];
float[] epitaxinsiX = new float[stoixeia];
float[] epitaxinsiY = new float[stoixeia];
float[] elastikotita = new float[stoixeia];
float[] aposbesi = new float[stoixeia];
float[] deltaX = new float[stoixeia];
float[] deltaY = new float[stoixeia];
float fxMouse, fyMouse;

void setup()  {
  frameRate(240);
  size(900,450);
  
  line0 = new SketchLine(30);
  line1 = new SketchLine(stoixeia);
  line2 = new SketchLine(stoixeia + 1);

  line0.calcType( 0.2, 0.65 );// 0.2, 0.65 
  line1.calcType( 0.1, 0.65 );// 0.2, 0.65 
  line2.calcType( 0.3, 0.65 );// 0.2, 0.65 

  background(0);
  noFill();
  smooth();

  for (int i=0; i<stoixeia; i++){
    elastikotita[i] = 0.2*(.07*(i+1));
    aposbesi[i] = 0.55-(0.02*i);
  }
}

void draw()  {
  myLine();
  noFill();
  if (mousePressed == true)  {  
    line0.calcPoints(mouseX, mouseY);
    line0.render(255,255,0, lineAlpha);
    line1.calcPoints(mouseX, mouseY);
    line1.render(252,4,74, lineAlpha);
    line2.calcPoints(mouseX, mouseY);
    line2.render(29,133,140, lineAlpha);
  } else {
      line0.calcPoints(mouseX, mouseY);
    line0.render(0,0,255, 0);
    line1.calcPoints(mouseX, mouseY);
    line1.render(255,255,0, 0);
    line2.calcPoints(mouseX, mouseY);
    line2.render(255,255,255, 0);
  
  }
  if (smoothFade) {
    fill(0,12);
    rect(-10,-10,width,height);
  } 
}

void myLine(){

  if (mousePressed == true)  {  
    if(miden == true) {
      for (int i=0; i<stoixeia; i++){
        x[i] = mouseX;
        y[i] = mouseY;
        miden = false;
      }
    }
    strokeL = strokeValue;
  }

  noFill(); 
  drawline();

}


void drawline(){
    fxMouse = mouseX;
    fyMouse = mouseY;
    for (int i=0; i<5; i++){
    if (i==0){
      deltaX[i] = (fxMouse - x[i]);
      deltaY[i] = (fyMouse - y[i]);
      if (mousePressed && xar)  {    
      }
      
    }
    else {
      deltaX[i] = (x[i-1]-x[i]);
      deltaY[i] = (y[i-1]-y[i]);
    }
    deltaX[i] *= elastikotita[i];
    deltaY[i] *= elastikotita[i];
    epitaxinsiX[i] += deltaX[i];
    epitaxinsiY[i] += deltaY[i];
    x[i] += epitaxinsiX[i];
    y[i] += epitaxinsiY[i];
    vertex(x[i],y[i]);
    epitaxinsiX[i] *= aposbesi[i];
    epitaxinsiY[i] *= aposbesi[i];
  }
  endShape();
}


void mouseReleased()  {
  if(xar)  {   
  }

  line0.calcPointsStart(mouseX, mouseY);
}

void mousePressed()  {
  line0.calcPointsStart(mouseX, mouseY);
  line1.calcPointsStart(mouseX, mouseY);
  line2.calcPointsStart(mouseX, mouseY);  
}


void mouseDragged() {
}


void keyPressed(){
  if (key == 'w') {
    background(255)
  }
  if (key == 'b') {
    background(0);
  }  
  if (key == 's') {
    smoothFade = !smoothFade;
  }  

}

class  SketchLine  {
  int stoixeia = 1000, colorR, colorG, colorB, lineAlpha = 25; 
  float elast, aposv;
  float[] x = new float[stoixeia];
  float[] y = new float[stoixeia];
  float[] epitaxinsiX = new float[stoixeia];
  float[] epitaxinsiY = new float[stoixeia];
  float[] elastikotita = new float[stoixeia];
  float[] aposvesi = new float[stoixeia];
  float[] deltaX = new float[stoixeia];
  float[] deltaY = new float[stoixeia];

  float pointX, pointY;


  SketchLine(int stoixeiaVar)  {
    stoixeia = stoixeiaVar;
  }

  void calcType(float elastikotitaVar, float aposvesiVar)  {
    elast = elastikotitaVar;
    aposv = aposvesiVar;
    for (int i=0; i < stoixeia; i++){
      elastikotita[i] = elast*(.07*(i+1));
      aposvesi[i] = aposv-(0.02*i);
    }
  }

  void calcPoints(float pointXVar, float pointYVar)  {
    pointX = pointXVar;
    pointY = pointYVar;

    for (int i=0; i<stoixeia; i++){
      if (i==0){
        deltaX[i] = (pointX - x[i]);
        deltaY[i] = (pointY - y[i]);

      }  
      else  {
        deltaX[i] = (x[i-1]-x[i]);
        deltaY[i] = (y[i-1]-y[i]);
      }
      deltaX[i] *= elastikotita[i];
      deltaY[i] *= elastikotita[i];
      epitaxinsiX[i] += deltaX[i];
      epitaxinsiY[i] += deltaY[i];
      x[i] += epitaxinsiX[i];
      y[i] += epitaxinsiY[i];
      epitaxinsiX[i] *= aposvesi[i];
      epitaxinsiY[i] *= aposvesi[i];
    }
  }
  void calcPointsStart(float pointXVar, float pointYVar)  {
    pointX = pointXVar;
    pointY = pointYVar;
    for (int i=0; i<stoixeia; i++){
      x[i] = mouseX;
      y[i] = mouseY;
    }
  }


  void render(int colorRVar, int colorGVar, int colorBVar, int lineAlphaVar)  {
    colorR = colorRVar;
    colorG = colorGVar;
    colorB = colorBVar;    
    lineAlpha = lineAlphaVar;    
    noFill();
    stroke(colorR, colorG, colorB, lineAlpha);
    beginShape();
    for (int i = 0; i < stoixeia; i++)  {
      curveVertex(x[i], y[i]);
    }
    endShape();
  }

}                                                                                               
