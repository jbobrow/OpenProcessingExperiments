
import controlP5.*;

public int sz = 500;
public int csz = 130;

public int t = 0;
public int n = 4;
public int d = 29;

public int Width;
public int Height;
public int Thickness = 0;
public int Shade1 = 10;
public int Shade2 = 0;
public PVector prev = new PVector(0, 0);
public PVector maurerPt = new PVector(0, 0);
public int maurerT = 0;

public ControlP5 controlP5;

boolean clearScr = true;
boolean anim = true;

public void setup()
{
  //size(sz+20, sz+csz);
  size(520, 630);
  makeControls();
  smooth();
  Width = Height = sz;
  colorMode(HSB, 100);
}

public void makeControls() {
  controlP5 = new ControlP5(this);
  // name, min, max, default, x, y, width, height
  int offsetY = sz + 20 + 20;
  int offsetX = 20;
  int cid = 2;

  controlP5.addSlider("n", 1, 10, 4, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("d", 1, 100, 29, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("Shade1", 0, 100, 10, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Shade2", 0, 100, 0, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Thickness", 0, 5, 0, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
}

public void clearScreen() {
  rectMode(CENTER);
  fill(#FFFFFF);
  rect((sz+20)/2, sz/2, sz+20, sz+20+20);
  fill(#444444);
  rect((sz+20)/2, sz + csz/2 + 10, sz+20, csz-20);
}

PVector calcRose(int theta) {
  float angle = radians(theta);
  float side = cos(n * angle);
  return new PVector(
                      Width * side * sin(angle)/2 + Width/2 + 10,
                      Height * side * cos(angle)/2 + Height/2 + 10
                    );
}

void setColors(PVector nextPt) {
    float distFromCenter = (sqrt(sq(Width/2 - nextPt.x) + sq(Height/2 - nextPt.y)) / sqrt(sq(Width/2) + sq(Height/2))); // range from 0 to 1
    
    int range = abs(Shade1 - Shade2);
    color c = (Shade1 > Shade2) ? color(Shade1 - distFromCenter*range, 100, 100) : color(Shade1 + distFromCenter*range, 100, 100);
    fill(c);
    stroke(c);
}

void setMaurerColor(int index) {
  int range = abs(Shade1 - Shade2);
  float incr = ((float)index)/360;
  int alphaAndSat = (Thickness == 0) ? 90 : 60;
  color c = (Shade1 > Shade2) ? color(Shade1 - incr*range, alphaAndSat, 100, alphaAndSat) : color(Shade1 + incr*range, alphaAndSat, 100, alphaAndSat);
  fill(c);
  stroke(c);
}

public void draw() {
  if(!anim) return;
  
  PVector nextPt = calcRose(t);
  
  if(clearScr) { 
    clearScreen(); 
    clearScr = false; 
    strokeWeight(1);
    maurerPt = calcRose(0);
    for(int index=1; index < 361; index++) {
      nextPt = calcRose(index * d);
      setMaurerColor(index);
      line(maurerPt.x, maurerPt.y, nextPt.x, nextPt.y);
      maurerPt = nextPt;
    }    
  }
  else if(Thickness > 0) {
    setColors(nextPt);
    strokeWeight(Thickness*2);
    line(prev.x, prev.y, nextPt.x, nextPt.y);
  }
  prev = nextPt;
  t ++;
  if((t > 360) || (Thickness == 0)) anim = false;
}

public void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {
    if(theEvent.controller().id() != 0) {
      t = -1;
      prev.x = prev.y = 0;
      clearScr = true;
      anim = true;
    }
  }
}



