
/*
* author: tan
* http://wownder.windforwings.com/
*/

import controlP5.*;

public int sz = 500;
public int csz = 200;

public float t = 0;
public int a = 1;
public int b = 2;

public int Delta = 20;
public int Width;
public int Height;
public float roughness = 0.02;
public int Lines = 5;
public int Thickness = 1;
public int Shade = 128;

PVector prev = new PVector(0, 0);
float[] startline = new float[4];

public ControlP5 controlP5;

boolean clearScr = true;
boolean anim = true;
boolean recStart = true;

public void setup()
{
  //size(sz+20, sz+csz);
  size(520, 700);
  makeControls();
  smooth();
  Width = Height = sz;
}

public void makeControls() {
  controlP5 = new ControlP5(this);
  // name, min, max, default, x, y, width, height
  int offsetY = sz + 20 + 20;
  int offsetX = 20;
  int cid = 2;
  /*
  controlP5.addSlider("Width", sz/10, sz, sz, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 20;
  controlP5.addSlider("Height", sz/10, sz, sz, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 20;
  */
  controlP5.addSlider("Delta", 0, 4, 1, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("a", 1, 10, 1, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("b", 1, 10, 2, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("roughness", .01, 1, .02, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Lines", 0, 10, 5, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Thickness", 1, 10, 1, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Shade", 1, 255, 128, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addButton("Stop", 0, offsetX, offsetY, (30), 20).setId(0); 
  controlP5.addButton("Start", 0, offsetX+50, offsetY, (30), 20).setId(1); 
  offsetY += 40;
}

public void clearScreen() {
  rectMode(CENTER);
  fill(#FFFFFF);
  rect((sz+20)/2, sz/2, sz+20, sz+20+20);
  fill(#444444);
  rect((sz+20)/2, sz + csz/2 + 10, sz+20, csz-20);
}

PVector calcLissajous(float t) {
  return new PVector(
                      Width * sin(a*t + PI*Delta/2) / 2 + Width/2 + 10, 
                      Height * sin(b*t) / 2 + Height/2 + 10
                    );
}

void setColors(PVector nextPt) {
    color c = color(Shade, nextPt.x*256/Width, nextPt.y*256/Height, 100);
    fill(c);
    stroke(c);
}

public void draw() {
  if(!anim) return;
  
  PVector nextPt = calcLissajous(t);
  
  if(clearScr) { 
    clearScreen(); 
    clearScr = false; 
    startline[0] = prev.x = nextPt.x;
    startline[1] = prev.y = nextPt.y;
  }
  else {
    setColors(nextPt);
    strokeWeight(Thickness);
    line(prev.x, prev.y, nextPt.x, nextPt.y);
    
    if(Lines > 0) {
      strokeWeight(min(1, Thickness/3));
      PVector fut = calcLissajous(t + roughness*Lines);
      line(prev.x, prev.y, fut.x, fut.y);
    }
    
    if(recStart) {
      startline[2] = nextPt.x;
      startline[3] = nextPt.y;
      recStart = false;
    }
    //else if((abs(prev.x - startline[0]) + abs(prev.y - startline[1]) + abs(nextPt.x - startline[2]) + abs(nextPt.y - startline[3])) < 1) {
      //println("repeat stopped");
      //anim = false;
    //}
    //println((abs(prev.x - startline[0]) + abs(prev.y - startline[1]) + abs(nextPt.x - startline[2]) + abs(nextPt.y - startline[3])));      
  }
  prev = nextPt;
  t += roughness;
}

public void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {
    if(theEvent.controller().id() != 0) {
      t = 0;
      prev.x = prev.y = 0;
      clearScr = true;
      anim = true;
      recStart = true;
    }
  }
}

public void Stop(int val) {
  anim = false;
}



