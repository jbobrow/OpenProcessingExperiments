
import controlP5.*;
PFont myFont;

ControlP5 cp5;
PShape t, s;
public float[] rota = new float[3];
public float[] x = new float[3];
public float[] y = new float[3];
public float[] thesize = new float[3];
public float[] opac = new float[3];
public int typesize;

void setup() {
  size(700, 450);
  smooth();
  noStroke();
  shapeMode(CENTER);
  background(240, 240, 240);

  t = loadShape("wissenteilenkoennen_type.svg");
  s = loadShape("wissenteilenkoennen_shape.svg");
  t.disableStyle();
  s.disableStyle();

  randomLogo();

  fill(255, 255, 255);
  cp5 = new ControlP5(this);

  cp5.setColorLabel(0xffdddddd);
  cp5.setColorForeground(color(220, 220, 220));
  cp5.setColorBackground(color(255, 255, 255));
  cp5.setColorValue(color(110, 160, 55));
  cp5.setColorActive(color(210, 210, 210));



  for (int i=0;i<3;i++)
  {
    Slider slRota = cp5.addSlider("rota"+i, 0, 360);
    slRota.setValue(rota[i]);
    slRota.setId(i);
    Slider slthesize = cp5.addSlider("thesize"+i, 260, 320);
    slthesize.setValue(thesize[i]);
    slthesize.setId(i);
    Slider slx = cp5.addSlider("x"+i, -20, 20);
    slx.setValue(x[i]);
    slx.setId(i);
    Slider sly = cp5.addSlider("y"+i, -20, 20);
    sly.setValue(y[i]);
    sly.setId(i);
    Slider slopac = cp5.addSlider("opac"+i, 0, 255);
    slopac.setValue(opac[i]);
    slopac.setId(i);
  }
  cp5.addSlider("typesize", 230, 290);

  ControlFont cf1 = new ControlFont(createFont("Arial", 20));
  createButton("randomLogo", 10, 510, 400, color(100), cf1);
}
void draw() {

  pushMatrix();
  translate(350, 250);
  background(240, 240, 240);

  for (int i=0; i<3; i++) {
    drawShape(rota[i], x[i], y[i], thesize[i], opac[i]);
  }
  fill(240, 240, 240);
  shape(t, 0, 0, typesize, typesize);

  popMatrix();

  fill(246);
  rect(0, 0, 700, 83);
  fill(255);
  rect(0, 83, 700, 15);
  
  myFont = createFont("Arial", 12);
  textFont(myFont);
  fill(180);
  text("www.wissenteilen.com", 510, 390);
}
void drawShape (float srota, float sx, float sy, float ssize, float sopac)
{
  pushMatrix();
  rotate(radians(round(srota)));
  fill(110, 160, 55, round(sopac));
  shape(s, round(sx), round(sy), round(ssize), round(ssize));
  popMatrix();
}
void randomLogo() {
  for (int i=0; i<3; i++) {
    rota[i] = round(random(360)); 
    x[i] = random(-15, 15);
    y[i] = random(-15, 15);
    thesize[i] = 300;
    opac[i] = random(100, 200);
    typesize = round(random(230, 290));
  }
}
Button createButton(String theName, int theValue, int theX, int theY, color theColor, ControlFont theFont) {
  Button b = cp5.addButton(theName, theValue, theX, theY, 160, 39);
  b.setColorActive(color(100)); // color for mouse-over
  b.setColorBackground(color(90)); // default color
  b.captionLabel().setControlFont(theFont);
  return b;
}
void controlEvent(ControlEvent theEvent) {
  if (theEvent.isController()) {
    if (theEvent.controller().name().startsWith("rota")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<rota.length) {
        rota[id] = theEvent.value();
      }
    }
    if (theEvent.controller().name().startsWith("thesize")) {
      int id = theEvent.controller().id();
      if (id>=0 && id<thesize.length) {
        thesize[id] = theEvent.value();
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


