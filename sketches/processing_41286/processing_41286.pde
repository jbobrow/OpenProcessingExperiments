
import controlP5.*;

public int sz = 500;
public int csz = 170;

public int t = 0;
public float RADIUS_RATIO = 5;
public int R1 = 2;
public float scalingFactor = 1;
public int numLoops = 1;
public float trochoid_Ratio = 1;
public int epiOrHypo = -1;

public int Width;
public int Height;
public int Thickness = 2;
public int Shade1 = 26;
public int Shade2 = 0;
public PVector prev = new PVector(0, 0);

public ControlP5 controlP5;
public DropdownList typeSel;
  
boolean clearScr = true;
boolean anim = true;

public void setup()
{
  //size(sz+20, sz+csz);
  size(520, 670);
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
  int cid = 3;

  controlP5.addSlider("trochoid_Ratio", 0, 1, 1, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("RADIUS_RATIO", 1, 5, 2, offsetX, offsetY, (sz-100), 10).setId(cid++);
  offsetY += 15;
  controlP5.addSlider("Shade1", 0, 100, 26, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Shade2", 0, 100, 0, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 15;
  controlP5.addSlider("Thickness", 1, 5, 2, offsetX, offsetY, (sz-100), 10).setId(cid++); 
  offsetY += 25;
  typeSel = controlP5.addDropdownList("Type", offsetX, offsetY, 80, 40);
  typeSel.setId(2);
  typeSel.addItem("Epitrochoid", 1);
  typeSel.addItem("Hypotrochoid", -1);
  offsetX += 400;
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
  scalingFactor = (((float)Width-20)/2) / ((float)R1 * (RADIUS_RATIO + 1) + epiOrHypo*R1);
  numLoops = round(RADIUS_RATIO*100);
  println("ratio times 100: " + numLoops);
  do {
    if((numLoops % 5) == 0) numLoops /= 5;
    else if((numLoops % 2) == 0) numLoops /= 2;
    else break;
  } while(true);
  println("num loops: " + numLoops);
}

PVector calcCycloid(int theta) {
  float angle = radians(theta);
  return new PVector(
                      Width/2 + 10 + scalingFactor * (R1*(RADIUS_RATIO+epiOrHypo)*cos(angle) - epiOrHypo * trochoid_Ratio * R1*cos((RADIUS_RATIO+epiOrHypo)*angle)),
                      Height/2 + 10 + scalingFactor * (R1*(RADIUS_RATIO+epiOrHypo)*sin(angle) - trochoid_Ratio * R1*sin((RADIUS_RATIO+epiOrHypo)*angle))
                    );
}

void setColors(PVector nextPt) {
    float distFromCenter = (sqrt(sq(Width/2 - nextPt.x) + sq(Height/2 - nextPt.y)) / sqrt(sq(Width/2) + sq(Height/2))); // range from 0 to 1
    
    int range = abs(Shade1 - Shade2);
    color c = (Shade1 > Shade2) ? color(Shade1 - distFromCenter*range, 100, 100) : color(Shade1 + distFromCenter*range, 100, 100);
    fill(c);
    stroke(c);
}

public void draw() {
  if(!anim) return;

  if(clearScr) clearScreen(); 
  
  PVector nextPt = calcCycloid(t);
  
  if(clearScr) {
    clearScr = false;
    println("first point: " + nextPt + " t:" + t);
  }
  else {
    setColors(nextPt);
    strokeWeight(Thickness*2);
    if(t < 8) println("from: " + prev + " to " + nextPt + " t:" + t);
    line(prev.x, prev.y, nextPt.x, nextPt.y);
  }
  prev = nextPt;
  t += 2;
  if(t > 360*numLoops) {
    anim = false;
    println("stopped");
  }
  else if(t%360 == 0) {
    println("loop " + t/360 + " of " + numLoops);
  }
}

public void controlEvent(ControlEvent theEvent) {
  if(theEvent.isController()) {
    if(theEvent.controller().id() != 0) {
      t = 0;
      prev.x = prev.y = 0;
      clearScr = true;
      anim = true;
    }
  }
  else if(theEvent.isGroup()) {
    if(theEvent.group().id() == 2) {
      println(theEvent.group().value());
      epiOrHypo = Math.round(theEvent.group().value());
      t = 0;
      prev.x = prev.y = 0;
      clearScr = true;
      anim = true;
    }
  }
}

public void Stop(int val) {
  anim = false;
}


