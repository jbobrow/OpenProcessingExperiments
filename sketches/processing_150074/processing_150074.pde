

  
boolean miden, smoothFade;
boolean xar=true;
PGraphics pg;

  
int numFrames;;  // The number of frames in the animation
int frame = 0;
int velocidade=240;
int intervalo=0;
int tempo=240;
String [] imageFiles = {"ave_1.png","ave_2.png","ave_3.png","ave_4.png","ave_5.png","ave_6.png","ave_7.png","ave_8.png"};
PImage [] images;
    

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
  frameRate(velocidade);
  size(900,450,P2D);
  noCursor();
  numFrames=imageFiles.length;
  pg=createGraphics(900,450,P2D);
  // 
  // carregr imagens

  images=new PImage[imageFiles.length];
  for (int i=0;i<images.length;i++) {
    images[i]=loadImage(imageFiles[i]);
  }
    
  line0 = new SketchLine(30);
  line1 = new SketchLine(stoixeia);
  line2 = new SketchLine(stoixeia + 1);
  
  line0.calcType( 0.2, 0.65 );
  line1.calcType( 0.1, 0.65 );
  line2.calcType( 0.3, 0.65 );
  
  background(255);
  noFill();
  smooth();
  
  for (int i=0; i<stoixeia; i++){
    elastikotita[i] = 0.2*(.07*(i+1));
    aposbesi[i] = 0.55-(0.02*i);
  }
    pg.beginDraw();
    pg.background(255);
    pg.endDraw();
}
 
void draw()  {
 
  pg.beginDraw();
  pg.smooth();
  myLine();
  //pg.smooth();
  if (mousePressed == true)  {
    line0.calcPoints(mouseX, mouseY);
    line0.render(191,230,255, lineAlpha);
    line1.calcPoints(mouseX, mouseY);
    line1.render(92,117,142, lineAlpha);
    line2.calcPoints(mouseX, mouseY);
    line2.render(255,255,255, lineAlpha);
  } else {
      line0.calcPoints(mouseX, mouseY);
    line0.render(255,0,0, 0);
    line1.calcPoints(mouseX, mouseY);
    line1.render(255,255,0, 0);
    line2.calcPoints(mouseX, mouseY);
    line2.render(255,255,255, 0);
    
  }
  if (smoothFade) {
    pg.fill(0,12);
    pg.rect(0,0,width,height);
  }
  pg.endDraw();
  intervalo+=tempo;
  if (intervalo>velocidade) {
     frame = (frame+1) %numFrames;
     intervalo=0;
  }
  
  image (pg,0,0);
  image(images[frame], mouseX-100, mouseY-50);
  
}
  
void myLine(){
  
  if (mousePressed == true)  {
    if(miden == true) {
      for (int i=0; i<stoixeia; i++){
        x[i] = mouseX;// move worm
        y[i] = mouseY;
        miden = false;
      }
      //cursor(cur, 0,0);
    }
    strokeL = strokeValue;
  }
  
  
  pg.noFill();
  drawline();
  
}
  
  
void drawline(){
    fxMouse = mouseX;
    fyMouse = mouseY;
  //beginShape();
    for (int i=0; i<5; i++){
    if (i==0){
      deltaX[i] = (fxMouse - x[i]);
      deltaY[i] = (fyMouse - y[i]);
      
        
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
    //pg.vertex(x[i],y[i]);
    epitaxinsiX[i] *= aposbesi[i];    
    epitaxinsiY[i] *= aposbesi[i];
  }
 // pg.endShape();
}
  
  
  
void mouseReleased()  {
  
  line0.calcPointsStart(mouseX, mouseY);
}
  
void mouseMoved()  {
  line0.calcPointsStart(mouseX, mouseY);
  line1.calcPointsStart(mouseX, mouseY);
  line2.calcPointsStart(mouseX, mouseY);
}
  
  
void mouseDragged() {
}
  
  
void keyPressed(){
  if (key == 'z') {
    //cursor(cur, 0, 0);
  }
  if (key == 'b') {
    background(0);
  }
  if (key == 's') {
    smoothFade = !smoothFade;
  }
  
}
  
  

  
class  SketchLine  {
  int stoixeia = 1000, colorR, colorG, colorB, lineAlpha =50;
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
      elastikotita[i] = elast*(.07*(i+1));// 0.05  kai 0.005
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
    //pg.noFill();
    pg.smooth();
    pg.stroke(colorR, colorG, colorB, lineAlpha);
    pg.beginShape();
    for (int i = 0; i < stoixeia; i++)  {
      pg.curveVertex(x[i], y[i]);
    }
    pg.endShape();
  }
  
}



