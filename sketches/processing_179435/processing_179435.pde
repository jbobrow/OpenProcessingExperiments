
/*
drawing flowers
 
click everywhere on screen
 
*/
 
 
int nCentres = 30; 
float[] x0 = new float[nCentres], 
        y0 = new float[nCentres],
        oldx0 = new float[nCentres], 
        oldy0 = new float[nCentres],
        dx1 = new float[nCentres],
        dy1 = new float[nCentres],
        d1 = new float[nCentres],
        dx2 = new float[nCentres],
        dy2 = new float[nCentres],
        d2 = new float[nCentres];
float x1, y1, ax1, ay1, vx1, vy1;
float x2, y2, ax2, ay2, vx2, vy2;
float prevx1, prevy1;
float prevx2, prevy2;
float oldx1, oldy1, oldax1, olday1, oldvx1, oldvy1;
float oldx2, oldy2, oldax2, olday2, oldvx2, oldvy2;
boolean styleTrait, styleMilieu, styleExtremite, styleQuad;
int distMode = 0;
int[] nIter = {1, 5, 10, 50, 100, 500, 1000, 5000};
int nIterMax = nIter.length;
int nIterMode =  nIter.length - 3;
boolean styleAttraction = false;

int generation;

//gestion de la convergence
int windowSize = 50, nWindow = 0;
float distMax1, distMax2;

//scale and translation management (cf. http://webhome.cs.uvic.ca/~blob/courses/305/notes/pdf/using.pdf)
float xWindow, yWindow, wWindow, hWindow, xViewPort, yViewPort, wViewPort, hViewPort, windowToViewPortScale;
 
void setup() {
  size(800, 600);
  colorMode(HSB, 100, 100, 100);
  initDepart(width/2, height/2, min( width/2, height/2));
  styleExtremite = (random(10) > 5) && false;
  styleTrait = (random(10) > 5) && false;
  styleQuad = (random(10) > 5) && false;
  if( !styleExtremite && !styleTrait && !styleQuad)
    styleTrait = true;
  initViewPort();
}

float distance(float xi, float yi, float xf, float yf){
  if(distMode == 0) return sqrt((xf-xi)*(xf-xi)+(yf-yi)*(yf-yi));
  if(distMode == 1) return abs(xf - xi) + abs(yf - yi);
  if(distMode == 2) return max(abs(xf - xi), abs(yf - yi));
  return dist(xi, yi, xf, yf);
}
 
void distances() {
  for(int i = 0; i < nCentres; i++){
    dx1[i] = x0[i] - x1;
    dy1[i] = y0[i] - y1;
    d1[i] = distance(x0[i], x1, y0[i], y1);
    
    dx2[i] = x0[i] - x2;
    dy2[i] = y0[i] - y2;
    d2[i] = distance(x0[i], x2, y0[i], y2);
  }
}
 
void acceleration() {
  ax1 = 0; ay1 = 0; ax2 = 0; ay2 = 0;
  for(int i = 0; i < nCentres; i++){
    ax1 += dx1[i] * .02 / d1[i] / d1[i];
    ay1 += dy1[i] * .02 / d1[i] / d1[i];
    ax2 += dx2[i] * .02 / d2[i] / d2[i];
    ay2 += dy2[i] * .02 / d2[i] / d2[i];
  }
}
 
void reInitDepart() {
  background(95, 50, 25);
  for(int i = 0; i < nCentres; i++){
    x0[i] = oldx0[i];
    y0[i] = oldy0[i];
  }  
  x1  = oldx1 ;
  y1  = oldy1 ;
  vx1 = oldvx1;
  vy1 = oldvy1;
  x2  = oldx2 ;
  y2  = oldy2 ;
  vx2 = oldvx2;
  vy2 = oldvy2;
  generation = 0;
}

void initDepart(float ix, float iy, float radius) {
  background(95, 50, 25);
  for(int i = 0; i < nCentres; i++){
    x0[i] = random(width / 2) + width / 4;
    y0[i] = random(height / 2) + height / 4;
    oldx0[i] = x0[i];
    oldy0[i] = y0[i];
  }
  x1 = ix + random(-radius, radius);
  y1 = iy + random(-radius, radius);
  float vi = 2.0;
  vx1 = random(-vi, vi);
  vy1 = random(-vi, vi);
  x2  = ix + random(-radius, radius);
  y2  = iy + random(-radius, radius);
  vx2 = random(-vi, vi);
  vy2 = random(-vi, vi);
  
  oldx1  = x1 ;
  oldy1  = y1 ;
  oldvx1 = vx1;
  oldvy1 = vy1;
  oldx2  = x2 ;
  oldy2  = y2 ;
  oldvx2 = vx2;
  oldvy2 = vy2;
  generation = 0;
  
}

void initViewPort(){
  xViewPort = 0; yViewPort =0; wViewPort = width; hViewPort = height; 
  xWindow = xViewPort; yWindow = yViewPort; wWindow = wViewPort; hWindow = hViewPort; 
  windowToViewPortScale = (wWindow/wViewPort > hWindow/hViewPort) ? hWindow/hViewPort : wWindow/wViewPort;
}

void changeWindowSize(float x /* in window */, float y, float r){
  float xc = xInViewPort(x), yc = yInViewPort(y);
  wWindow = wWindow * r;
  hWindow = hWindow * r;
  windowToViewPortScale = (wWindow/wViewPort > hWindow/hViewPort) ? hWindow/hViewPort : wWindow/wViewPort;
  xWindow = xWindow + x - xInWindow(xc);
  yWindow = yWindow + y - yInWindow(yc);
}


float xInViewPort(float x){return (x - xWindow) * windowToViewPortScale + xViewPort;}
float yInViewPort(float y){return (y - yWindow) * windowToViewPortScale + yViewPort;}
float xInWindow(float x){return (x - xViewPort) / windowToViewPortScale + xWindow;}
float yInWindow(float y){return (y - yViewPort) / windowToViewPortScale + yWindow;}
 
void mousePressed() {
  background(95, 50, 25);
  if(mouseButton == LEFT) initDepart(mouseX, mouseY, 50.0);
}

void mouseWheel(MouseEvent event) {
  float e = event.getCount();
  float zoomStep = 0.1;
  float zoomFactor = 1.0 + e * zoomStep;
  if(zoomFactor != 1.0){
    changeWindowSize(xInWindow(event.getX()), yInWindow(event.getY()), zoomFactor);
    reInitDepart();
  } 
}
 
void keyPressed() {
  if (key == 's' || key == 'S') {
    saveFrame();
  }
  if (key == 'l' || key == 'L') {
    styleTrait = !styleTrait;
    reInitDepart();
  }
  if (key == 'e' || key == 'E') {
    styleExtremite = !styleExtremite;
    reInitDepart();
  }
  if (key == 'm' || key == 'M') {
    styleMilieu = !styleMilieu;
    reInitDepart();
  }
  if (key == 'a' || key == 'A') {
    styleAttraction = !styleAttraction;
    reInitDepart();
  }
  if (key == 'q' || key == 'Q') {
    styleQuad = !styleQuad;
    reInitDepart();
  }
  if (key == 'n' || key == 'N') {
    initDepart(width/2, height/2, min( width/2, height/2));
  }
  if (key == 'd' || key == 'D') {
    distMode++;
    if(distMode > 3) distMode = 0;
    reInitDepart();
  }
  if (key == 'i' || key == 'I') {
    nIterMode++;
    if(nIterMode >= nIterMax) nIterMode = 0;
    reInitDepart();
  }
  if (key == '0') {
    initViewPort();
    reInitDepart();
  }
  float step = 10.0, stepx = 0.0, stepy = 0.0;
  stepx = key == '6' ? -step : key == '4' ? +step : 0.0;
  stepy = key == '2' ? -step : key == '8' ? +step : 0.0;
  if(abs(stepx) + abs(stepy) != 0.0){
    xWindow += stepx / windowToViewPortScale; yWindow += stepy / windowToViewPortScale;
    reInitDepart();
  }
  float zoomStep = 0.1;
  float zoomFactor = 1.0 + (key == '7' ? zoomStep : key == '1' ? -zoomStep : 0.0);
  if(zoomFactor != 1.0){
    changeWindowSize(xInWindow(wViewPort/2), yInWindow(hViewPort/2), zoomFactor);
    reInitDepart();
  } 
}
 
void draw() {
  //background(95,50,25);
  for(int i = 0; i < nIter[nIterMode] ; i++){
      generation++;
      float xDisp1 = xInViewPort(x1), yDisp1 = yInViewPort(y1);
      float xDisp2 = xInViewPort(x2), yDisp2 = yInViewPort(y2);
      if (styleExtremite) {
        noStroke();
        fill((float)(generation%1000)/10, 100, 100);
        ellipse(xDisp1, yDisp1, 10, 10);
        fill((float)((generation+100)%1000)/10, 100, 100);
        ellipse(xDisp2, yDisp2, 10, 10);
      }
      if (styleMilieu) {
        noStroke();
        fill((float)((generation+50)%1000)/10, 100, 100);
        ellipse((xDisp1+xDisp2)/2, (yDisp1+yDisp2)/2, 10, 10);
      }
      if (styleTrait) {
        stroke((float)((generation+50)%1000)/10, 100, 100);
        line(xDisp1, yDisp1, xDisp2, yDisp2);
      }
      if(generation >=2 && styleQuad) {
        stroke((float)((generation+50)%1000)/10, 100, 100);
        fill((float)((generation+50)%1000)/10, 100, 100);
        quad(prevx1, prevy1, prevx2, prevy2, xDisp2, yDisp2, xDisp1, yDisp1);
      }
      prevx1 = xDisp1; prevy1 = yDisp1;
      prevx2 = xDisp2; prevy2 = yDisp2;
      distances();
      acceleration();
      vx1 = vx1 + ax1 - vx1 / 1000;
      vy1 = vy1 + ay1 - vy1 / 1000;
      //float v1 = abs(vx1) + abs(vy1);
      //v1 = max(abs(vx1), abs(vy1));
      y1 = y1 + vy1;
      x1 = x1 + vx1;
      /*
      distances();
      if (d1 < 10 && v1 < 10) {
        vx1 = 0;
        vy1 = 0;
      }
      */
      vx2 = vx2 + ax2 - vx2 / 1000;
      vy2 = vy2 + ay2 - vy2 / 1000;
      //float v2 = abs(vx2) + abs(vy2);
      //v2 = max(abs(vx2), abs(vy2));
      y2 = y2 + vy2;
      x2 = x2 + vx2;
      /*
      distances();
      if (d2 < 10 && v2 < 10) {
        vx2 = 0;
        vy2 = 0;
      }
      */
  }
  stroke(0);
  fill(#FFFFFF);
  if(styleAttraction) for(int j = 0 ; j < nCentres; j++) ellipse(xInViewPort(x0[j]), yInViewPort(y0[j]), 10, 10);

  //ellipse(xCenter, yCenter, 20,20);

  String txt = "(S)ave picture - (N)ew - redraw with" + (styleTrait ? "out" : "") + " (L)ine" +
                     ", with" + (styleMilieu ? "out" : "") + " (M)iddle point" +
                     ", with" + (styleExtremite ? "out" : "") + " (E)nd points" +
                     ", with" + (styleQuad ? "out" : "") + " (Q)uad" +
                     ", with" + (styleAttraction ? "out" : "") + " (A)ttraction points" +
                     ", with other (D)istance comp mode (current :" + distMode + ")" +
                     ", with other (I)terations mode (current :" + nIter[nIterMode] + ")";
  textSize(12);
  fill(#000000);
  rect(0,height-15,width,height);
  String txttxt = txt + "    " + txt;
  stroke(#FFFFFF);
  fill(#FFFFFF);
  text("zoom : " + windowToViewPortScale + " / " + txttxt.substring((frameCount / 10) % txt.length()),0,height-3);
}

