
//Homework 4 - 60-257
// copyright Eric Mackie September 2011 Pittsburgh, PA 15221
float x;
float y;
float d;
float r;
float CRo;
float CGo;
float CBo;
float CRi;
float CGi;
float CBi;
float CRb;
float CGb;
float CBb;
float CRs;
float CGs;
float CBs;
void setup() {
  size(400, 400);
  ellipseMode(CENTER);
  d=200;
  x=0;
  y=0;
  r=0;
  CRo=185;
  CGo=225;
  CBo=135;
  CRi=245;
  CGi=205;
  CBi=125;
  CRb=135;
  CGb=100;
  CBb=15;
  CRs=55;
  CGs=155;
  CBs=50;
}

void draw() {
  translate(mouseX, mouseY);
  noCursor();
  rotate(r);
  if (keyPressed) {
    if (key == '1') {
      CRo=185;
      CGo=225;
      CBo=135;
    }
  }
  if (keyPressed) {
    if (key == '2') {
      CRo=135;
      CGo=195;
      CBo=225;
    }
  }
  if (keyPressed) {
    if (key == '3') {
      CRo=225;
      CGo=200;
      CBo=135;
    }
  }
  background(CRo, CGo, CBo);
  


  //inner Tree
  if (keyPressed) {
    if (key == '1') {
      CRi=245;
      CGi=205;
      CBi=125;
    }
  }
  if (keyPressed) {
    if (key == '2') {
      CRi=125;
      CGi=245;
      CBi=155;
    }
  }
  if (keyPressed) {
    if (key == '3') {
      CRi=125;
      CGi=205;
      CBi=245;
    }
  }
  fill(CRi,CGi,CBi);
  
  //Tree Border
  if (keyPressed) {
    if (key == '1') {
      CRb=135;
      CGb=100;
      CBb=15;
    }
  }
  if (keyPressed) {
    if (key == '2') {
      CRb=15;
      CGb=135;
      CBb=75;
    }
  }
  if (keyPressed) {
    if (key == '3') {
      CRb=15;
      CGb=95;
      CBb=135;
    }
  }
  stroke(CRb, CGb, CBb);
  strokeWeight(3);
  ellipse(x, y, d, d);

  //Curve Sets
  smooth();
  strokeWeight(3);
  if (keyPressed) {
    if (key == '1') {
      CRs=55;
      CGs=155;
      CBs=50;
    }
  }
  if (keyPressed) {
    if (key == '2') {
      CRs=75;
      CGs=50;
      CBs=155;
    }
  }
  if (keyPressed) {
    if (key == '3') {
      CRs=155;
      CGs=75;
      CBs=50;
    }
  }
  stroke(CRs, CGs, CBs);
  noFill();

  //Backbone E
  beginShape();
  curveVertex(x-.45*d, y-.35*d);
  curveVertex(x-.425*d, y-.23*d);
  curveVertex(x-.4*d, y);
  curveVertex(x-.425*d, y+.23*d);
  curveVertex(x-.45*d, y+.4*d);
  endShape();

  beginShape();
  curveVertex(x-.48*d, y-.4*d);
  curveVertex(x-.44*d, y-.2*d);
  curveVertex(x-.415*d, y);
  curveVertex(x-.44*d, y+.2*d);
  curveVertex(x-.48*d, y+.4*d);
  endShape();

  //Top E
  beginShape();
  curveVertex(x, y-.1*d);
  curveVertex(x-.45*d, y-.05*d);
  curveVertex(x-.325*d, y-.35*d);
  curveVertex(x-.25*d, y-.15*d);
  curveVertex(x-.1*d, y);
  endShape();

  //Bottom E
  beginShape();
  curveVertex(x, y+.1*d);
  curveVertex(x-.45*d, y+.05*d);
  curveVertex(x-.325*d, y+.35*d);
  curveVertex(x-.25*d, y+.15*d);
  curveVertex(x-.1*d, y);
  endShape();

  //Middle Bar E
  beginShape();
  curveVertex(x-.5*d, y+.1*d);
  curveVertex(x-.45*d, y-.025*d);
  curveVertex(x-.4*d, y+.025*d);
  curveVertex(x-.3*d, y-.02*d);
  curveVertex(x-.25*d, y);
  endShape();

  beginShape();
  curveVertex(x-.5*d, y-.1*d);
  curveVertex(x-.45*d, y+.025*d);
  curveVertex(x-.4*d, y-.025*d);
  curveVertex(x-.3*d, y+.02*d);
  curveVertex(x-.25*d, y);
  endShape();

  //Left Column M
  beginShape();
  curveVertex(x-.225*d, y-.5*d);
  curveVertex(x-.17*d, y-.45*d);
  curveVertex(x-.225*d, y-.25*d);
  curveVertex(x-.17*d, y-.1*d);
  curveVertex(x-.225*d, y+.25*d);
  curveVertex(x-.17*d, y+.45*d);
  curveVertex(x-.225*d, y+.5*d);
  endShape();

  beginShape();
  curveVertex(x-.24*d, y-.5*d);
  curveVertex(x-.185*d, y-.44*d);
  curveVertex(x-.24*d, y-.25*d);
  curveVertex(x-.185*d, y-.1*d);
  curveVertex(x-.24*d, y+.25*d);
  curveVertex(x-.185*d, y+.44*d);
  curveVertex(x-.24*d, y+.5*d);
  endShape();

  beginShape();
  curveVertex(x-.17*d, y-.5*d);
  curveVertex(x-.225*d, y-.4*d);
  curveVertex(x-.17*d, y-.25*d);
  curveVertex(x-.225*d, y);
  curveVertex(x-.17*d, y+.15*d);
  curveVertex(x-.225*d, y+.4*d);
  curveVertex(x-.17*d, y+.5*d);
  endShape();

  //Right Column M
  beginShape();
  curveVertex(x+.225*d, y-.5*d);
  curveVertex(x+.17*d, y-.45*d);
  curveVertex(x+.225*d, y-.25*d);
  curveVertex(x+.17*d, y-.1*d);
  curveVertex(x+.225*d, y+.25*d);
  curveVertex(x+.17*d, y+.45*d);
  curveVertex(x+.225*d, y+.5*d);
  endShape();

  beginShape();
  curveVertex(x+.24*d, y-.5*d);
  curveVertex(x+.185*d, y-.44*d);
  curveVertex(x+.24*d, y-.25*d);
  curveVertex(x+.185*d, y-.1*d);
  curveVertex(x+.24*d, y+.25*d);
  curveVertex(x+.185*d, y+.44*d);
  curveVertex(x+.24*d, y+.5*d);
  endShape();

  beginShape();
  curveVertex(x+.17*d, y-.5*d);
  curveVertex(x+.225*d, y-.4*d);
  curveVertex(x+.17*d, y-.25*d);
  curveVertex(x+.225*d, y);
  curveVertex(x+.17*d, y+.15*d);
  curveVertex(x+.225*d, y+.4*d);
  curveVertex(x+.17*d, y+.5*d);
  endShape();

  //V of M
  beginShape();
  curveVertex(x-.25*d, y-.1*d);
  curveVertex(x-.23*d, y-.35*d);
  curveVertex(x+.02*d, y);
  curveVertex(x-.025*d, y+.15*d);
  curveVertex(x-.2*d, y+.35*d);
  endShape();

  beginShape();
  curveVertex(x+.25*d, y-.1*d);
  curveVertex(x+.23*d, y-.35*d);
  curveVertex(x-.02*d, y);
  curveVertex(x+.025*d, y+.15*d);
  curveVertex(x+.2*d, y+.35*d);
  endShape();

  //Down Teardrop
  beginShape();
  curveVertex(x, y);
  curveVertex(x-.025*d, y+.2*d);
  curveVertex(x+.15*d, y+.4*d);
  curveVertex(x, y+.48*d);
  curveVertex(x-.15*d, y+.4*d);
  curveVertex(x+.025*d, y+.2*d);
  curveVertex(x, y);
  endShape();

  //Up Teardrop
  beginShape();
  curveVertex(x, y);
  curveVertex(x-.025*d, y-.2*d);
  curveVertex(x+.15*d, y-.4*d);
  curveVertex(x, y-.48*d);
  curveVertex(x-.15*d, y-.4*d);
  curveVertex(x+.025*d, y-.2*d);
  curveVertex(x, y);
  endShape();


  //D Backbone
  beginShape();
  curveVertex(x, y-.5*d);
  curveVertex(x+.24*d, y-.41*d);
  curveVertex(x+.3*d, y);
  curveVertex(x+.24*d, y+.41*d);
  curveVertex(x, y+.5*d);
  endShape();

  beginShape();
  curveVertex(x, y-.5*d);
  curveVertex(x+.27*d, y-.4*d);
  curveVertex(x+.32*d, y);
  curveVertex(x+.27*d, y+.4*d);
  curveVertex(x, y+.5*d);
  endShape();

  //D )curve
  beginShape();
  curveVertex(x, y);
  curveVertex(x+.25*d, y+.15*d);
  curveVertex(x+.325*d, y+.35*d);
  curveVertex(x+.475*d, y);
  curveVertex(x+.325*d, y-.35*d);
  curveVertex(x+.25*d, y-.15*d);
  curveVertex(x, y);
  endShape();

  if (mousePressed) {
    d=d+10;
  } 

  else {
    if (d > 10) {
      for (int i =1; i<3; i++) {
        d=d-1*i;
      }
    }
  }
  if (keyPressed) {
    if (keyCode == RIGHT) {
      r += PI/50;
    }
  }
  if (keyPressed) {
    if (keyCode == LEFT) {
      r -= PI/50;
    }
  }
}

