

float pos1 = map(sin(0.05), 0., 1., 0, 350);
float pos2 = map(sin(0.1), 0., 1., 0, 350);
float pos3 = map(sin(0.15), 0., 1., 0, 350);
float pos4 = map(sin(0.2), 0., 1., 0, 350);
float pos5 = map(sin(0.26), 0., 1., 0, 350);
float pos6 = map(sin(0.31), 0., 1., 0, 350);
float pos7 = map(sin(0.38), 0., 1., 0, 350);
float pos8 = map(sin(0.46), 0., 1., 0, 350);
float pos9 = map(sin(0.55), 0., 1., 0, 350);
float pos10 = map(sin(0.65), 0., 1., 0, 350);
float pos11 = map(sin(0.76), 0., 1., 0, 350);
float pos12 = map(sin(0.9), 0., 1., 0, 350);
float x =-5;
float y = 5;

void setup() {
  frameRate(60);
  size(700, 700);
}

void draw() {
  if (mousePressed) {
    fill(255, 200, 150, 5);
  } 
  else {
    
  }
  rect(0, 0, 700, 700);
  noFill();
  noStroke();

  pushMatrix();
  translate(width*0.5, height*0.5);
  rotate(frameCount / 50.0);

  s(20, pos1, pos1);
  p(22, pos2, pos2);
  e(24, pos3, pos3);
  c1(26, pos4, pos4);
  t(28, pos5, pos5);
  a1(30, pos6, pos6);
  c2(32, pos7, pos7);
  u(34, pos8, pos8);
  l(36, pos9, pos9);
  a2(38, pos10, pos10);
  r(40, pos11, pos11);

  popMatrix();
}





void s(float textsize, float xloc, float yloc) {
  x = x+30;
  if (x >= 700) {
    y = y+10;
    x = -5;
  }
  if (y >= 700) {
    y = 5;
  }
  fill(x/random(3), random(255), y/3);
  stroke(x/random(4), random(200), y/3);
  rotate(frameCount / 1.5);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("S", xloc, yloc);
  noFill();

  strokeWeight(1);
  ellipse(0, 0, x, y*1.5);
  noStroke();
}

void p(float textsize, float xloc, float yloc) {
  rotate(frameCount / 2);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("P", xloc, yloc);
  
}

void e(float textsize, float xloc, float yloc) {
  rotate(frameCount / 1);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("E", xloc, yloc);
}

void c1(float textsize, float xloc, float yloc) {
  rotate(frameCount / 1);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("C", xloc, yloc);
}

void t(float textsize, float xloc, float yloc) {
  rotate(frameCount / 2);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("T", xloc, yloc);
}

void a1(float textsize, float xloc, float yloc) {
  rotate(frameCount / 1);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("A", xloc, yloc);
}

void c2(float textsize, float xloc, float yloc) {
  rotate(frameCount / 3);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("C", xloc, yloc);
}

void u(float textsize, float xloc, float yloc) {
  rotate(frameCount / 2);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("U", xloc, yloc);
}

void l(float textsize, float xloc, float yloc) {
  rotate(frameCount / 4);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("L", xloc, yloc);
}

void a2(float textsize, float xloc, float yloc) {
  rotate(frameCount / 2);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("A", xloc, yloc);
}

void r(float textsize, float xloc, float yloc) {
  rotate(frameCount / 3);
  textSize(textsize);
  textAlign(CENTER, CENTER);
  textLeading(40);
  text("R", xloc, yloc);
}

