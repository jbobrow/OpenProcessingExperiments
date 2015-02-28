
import controlP5.*;
import processing.pdf.*;
PFont myFont;

ControlP5 cp5;
PShape t, s;
public float[] Rot = new float[3];
public float[] x = new float[3];
public float[] y = new float[3];
public float[] big = new float[3];
public float[] opac = new float[3];
public int typesize;
boolean saveOneFrame = false;

void setup() {
  size(700, 450);
  smooth();
  noStroke();
  shapeMode(CENTER);
  background(255);

  t = loadShape("wissenteilenkoennen_type.svg");
  t.disableStyle();
  
  s = loadShape("wissenteilenkoennen_shape.svg");
  s.disableStyle();
  
  randomLogo();
  fill(255, 255, 255);
  
  cp5 = new ControlP5(this);

  // Control Stylings
  cp5.setColorLabel(color(43,117,120)); //
  cp5.setColorForeground(color(124, 203, 207));
  cp5.setColorBackground(color(79,184,189));
  cp5.setColorValue(color(246)); //50,118,121
  cp5.setColorActive(color(152,214,217));

  // Generate all Controls
  for (int i=0;i<3;i++)
  {
    Slider slRot = cp5.addSlider("Rot"+i,0,360, 10+i*230, 10, 20,50);
    
    slRot.setValue(Rot[i]);
    slRot.setId(i);
    Slider slbig = cp5.addSlider("big"+i,260,320, 35+i*230,10, 20,50);
    slbig.setValue(big[i]);
    slbig.setId(i);
    Slider slx = cp5.addSlider("x"+i, -20,20, 60+i*230,10,20,50);
    slx.setValue(x[i]);
    slx.setId(i);
    Slider sly = cp5.addSlider("y"+i, -20,20, 85+i*230,10, 20,50);
    sly.setValue(y[i]);
    sly.setId(i);
    Slider slopac = cp5.addSlider("opac"+i, 0,255, 110+i*230,10,20,50);
    slopac.setValue(opac[i]);
    slopac.setId(i);
  }
  cp5.addSlider("typesize", 230, 290, 10, 81, 120, 15);

  ControlFont cf1 = new ControlFont(createFont("Arial", 14));
  createButton("randomLogo", 10, 510, 375, color(100), cf1);
  createButton("saveAsPdf", 10, 510, 410, color(100), cf1);
  
  myFont = createFont("Arial", 12);
  textFont(myFont);
  fill(180);
  text("www.wissenteilen.com", 10, 440);
  
}
void draw() {

  if(saveOneFrame == true){
    beginRecord(PDF, "logo.pdf");
    noStroke();
    shapeMode(CENTER);
  }
  pushMatrix();
  
  fill(246);
  rect(0, 0, 700, 83);
  fill(230);
  rect(0, 78, 700, 20);
  
  fill(255);
  rect(0, 98, 700, 332);
  
  translate(350, 250);
  

  for (int i=0; i<3; i++) {
    drawShape(Rot[i], x[i], y[i], big[i], opac[i]);
  }
  fill(255);
  shape(t, 0, 0, typesize, typesize);

  popMatrix();

  
  if(saveOneFrame == true){
    endRecord();
    saveOneFrame = false;
  }
}
void drawShape (float sRot, float sx, float sy, float ssize, float sopac)
{
  pushMatrix();
  rotate(radians(round(sRot)));
  fill(110, 160, 55, round(sopac));
  shape(s, round(sx), round(sy), round(ssize), round(ssize));
  popMatrix();
}
void saveAsPdf(){
  saveOneFrame = true;
}
void randomLogo() {
  for (int i=0; i<3; i++) {
    Rot[i] = round(random(360)); 
    x[i] = random(-15, 15);
    y[i] = random(-15, 15);
    big[i] = 300;
    opac[i] = random(100, 200);
    typesize = round(random(230, 290));
  }
}
Button createButton(String theName, int theValue, int theX, int theY, color theColor, ControlFont theFont) {
  Button b = cp5.addButton(theName, theValue, theX, theY, 160, 30);
  b.captionLabel().setControlFont(theFont);
  b.setColorLabel(color(255));
  return b;
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    if (theEvent.controller().name().startsWith("Rot")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<Rot.length) {
        Rot[id] = theEvent.value();
      }
    }
    if (theEvent.controller().name().startsWith("big")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<big.length) {
        big[id] = theEvent.value();
      }
    }
    if (theEvent.controller().name().startsWith("x")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<x.length) {
        x[id] = theEvent.value();
      }
    }
    if (theEvent.controller().name().startsWith("y")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<y.length) {
        y[id] = theEvent.value();
      }
    }
    if (theEvent.controller().name().startsWith("opac")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<opac.length) {
        opac[id] = theEvent.value();
      }
    }
  }
}

void keyPressed() {
  switch(key) {
    case('s'):saveOneFrame = true;break;
  }
}


