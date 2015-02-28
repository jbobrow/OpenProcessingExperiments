
/* @pjs font="RockwellB.ttf"; */
PFont font;
float opa;
int ypos;
int xpos;
int inc;
int ink;
color col;
boolean change;
boolean a = false;
boolean b = false;
boolean c = false;

void setup() {
  size(700, 100);
  col = color(0, 0, 200);
  font = loadFont("RockwellB.ttf");
  ypos = 70;
  smooth();
  textSize(60);
  textFont(font, 60);
  frameRate(120);
  change = false;
}

void first() {
  background(255);
  font = loadFont("RockwellB.ttf");
  inc++;
  xpos=inc/12;
  opa=mouseY*2.55;

  if (change == true) {
    col = color(int(random(255)), int(random(255)), int(random(255)));
    change = false;
  }

  if (mousePressed) {
    change=true;
  }

  if (inc > 1000) {
    inc = 1000;
    noStroke();
    fill(col, opa);
    ellipse(xpos*7, height/2, 25, 25);
    ellipse(xpos*1.5, height/2, 25, 25);
  }

  else {
    noStroke();
    fill(col, opa);
    ellipse(mouseX, mouseY, 25, 25);
  }

  fill(col, opa);
  text("1", 3*xpos, ypos);
  text("2", 4*xpos, ypos);
  text("3", 5*xpos, ypos);
  noStroke();
  ellipse(mouseX, mouseY, 25, 25);
}

void draw() {
  first();
  if (a) {
    background(255);
    fill(col, opa);
    text("K", 2*xpos, ypos);
    text("E", 3*xpos, ypos);
    text("V", 4*xpos, ypos);
    text("I", 5*xpos, ypos);
    text("N", 6*xpos, ypos);
    inc=1000;
    ellipse(xpos*7, height/2, 25, 25);
    ellipse(xpos*1.5, height/2, 25, 25);
  }
  if (b) {
    background(255);
    fill(col, opa);
    text("S", 2.5*xpos, ypos);
    text("A", 3.5*xpos, ypos);
    text("Y", 4.5*xpos, ypos);
    text("S", 5.5*xpos, ypos);
    inc=1000;
    ellipse(xpos*7, height/2, 25, 25);
    ellipse(xpos*1.5, height/2, 25, 25);
  }
  if (c) {
    background(255);
    fill(col, opa);
    text("H", 2*xpos, ypos);
    text("E", 3*xpos, ypos);
    text("L", 4*xpos, ypos);
    text("L", 5*xpos, ypos);
    text("O", 6*xpos, ypos);
    inc=1000;
    ellipse(xpos*7, height/2, 25, 25);
    ellipse(xpos*1.5, height/2, 25, 25);
  }

  if (keyPressed == true) {
    if (key == '1') {
      a=true;
      b=false;
      c=false;
    }
    if (key == '2') {
      a=false;
      b=true;
      c=false;
    }
    if (key == '3') {
      a=false;
      b=false;
      c=true;
    }
    if (key == ' ') {
      inc=0;
      fill(col, opa);
      text("1", 3*xpos, ypos);
      text("2", 4*xpos, ypos);
      text("3", 5*xpos, ypos);
      noStroke();
      ellipse(mouseX, mouseY, 25, 25);
      a=false;
      b=false;
      c=false;
    }
  }
}



