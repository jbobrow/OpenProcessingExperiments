
float oX, oY, diam, unit, x, y, c2x, c2y, c3x, c3y;
int num = 12, sz = 40, sat=90, br=90, modus, counter;
color[] f1 = {
  #000000, #000000, #000000, #000000
}; //array for the fill colors
color[] f2 = {
  #000000, #000000, #000000, #000000
}; //array for the fill colors
color[] f3 = {
  #000000, #000000, #000000, #000000
}; //array for the fill colors

void setup() {
  size(700, 700);
  colorMode(HSB, 255, 100, 100);
  strokeCap(SQUARE);
  oX = width/2;
  oY = height*.4;
  diam = width/2;
  unit = TWO_PI/num;
}

void draw() {
  background(#ffffff);

  for (int i=0; i<num; i++) {

    noFill();
    stroke(255/num*i, constrain(sat, 10, 100), constrain(br, 10, 100));
    strokeWeight(100);
    arc(oX, oY, diam, diam, i*unit, (i+0.9)*unit);
  }

  float angleC1 = atan2(mouseY-oY, mouseX-oX);
  x = oX + cos(angleC1)*(diam/2);
  y = oY + sin(angleC1)*(diam/2);

  float angleC2 = atan2(y-oY, x-oX)+PI-unit;
  c2x = oX + cos(angleC2)*diam/2; 
  c2y = oY + sin(angleC2)*diam/2; 

  float angleC3 = atan2(y-oY, x-oX)+PI+unit;
  c3x = oX + cos(angleC3)*diam/2; 
  c3y = oY + sin(angleC3)*diam/2; 

  strokeWeight(10);
  stroke(#ffffff);
  ellipse(x, y, sz, sz);
  strokeWeight(5);
  ellipse(c2x, c2y, sz, sz);
  strokeWeight(5);
  ellipse(c3x, c3y, sz, sz);

  float slice = width/4;
  float boxSize = slice*.5;

  for (int i=0; i<4; i++) {
    strokeWeight(2);
    fill(f1[i]);
    rect((i+0.5)*slice, width*.8+(boxSize/3*0), boxSize, boxSize/3);
    fill(f2[i]);
    rect((i+0.5)*slice, width*.8+(boxSize/3), boxSize, boxSize/3);
    fill(f3[i]);
    rect((i+0.5)*slice, width*.8+(boxSize/3*2), boxSize, boxSize/3);
    strokeWeight(20);
    rectMode(CENTER);
  }
}

void mouseClicked() {
  f1[counter]=get(int(x), int(y));
  f2[counter]=get(int(c2x), int(c2y));
  f3[counter]=get(int(c3x), int(c3y));
  counter++;
  if (counter>3) counter=0;
}


void keyPressed() {
  if (key==CODED) {
    if (keyCode==LEFT) {
      sat--;
    }
    if (keyCode==RIGHT) {
      sat++;
    }
    if (keyCode==UP) {
      br++;
    }
    if (keyCode==DOWN) {
      br--;
    }
  }
  if (key=='r') {
    br =90;
    sat=90;
  }
}

