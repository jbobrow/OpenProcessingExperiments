
//global variables

boolean button = false;
boolean button2 = false;
boolean button3 = false;

int aa = 50;
int ab = 300;
int ac = 75;
int ad = 50;

int ba = 150;
int bb = 300;
int bc = 75;
int bd = 50;

int ca = 250;
int cb = 300;
int cc = 75;
int cd = 50;

int s = 10;
int ss = 11;

void setup () {
  size (370,400);
  background (240);
  smooth();
}

void mousePressed () {

  if (mouseButton == RIGHT) {
    if ((mouseX > aa) && (mouseX < aa+ac) && (mouseY < ab+ad )) {
      button =!button;
      button2 =false;
      button3 =false;
    }
    if ((mouseX > ba) && (mouseX < ba+bc) && (mouseY < bb+bd )) {
      button2 =!button2;
      button =false;
      button3 =false;
    }
    if ((mouseX > ca) && (mouseX < ca+cc) && (mouseY < cb+cd )) {
      button3 =!button3;
      button2 =false;
      button =false;
    }
  }
}

void draw() {

  strokeWeight (5);
  noFill();
  rect (width-width+10, height-height+10, width-20,250);

  noStroke();
  fill (0);
  if (mousePressed && mouseButton == LEFT) {
    ellipse (mouseX,mouseY,s,s);
  }
  if (button) {
    fill (255,0,0);
    if (mousePressed && mouseButton == LEFT) {
      ellipse (mouseX,mouseY,ss,ss);
    }
  }

  if (button2) {
    fill (0,255,0);
    if (mousePressed && mouseButton == LEFT) {
      ellipse (mouseX,mouseY,ss,ss);
    }
  }

  if (button3) {
    fill (0,0,255);
    if (mousePressed && mouseButton == LEFT) {
      ellipse (mouseX,mouseY,ss,ss);
    }
  }
  fill (255,0,0);
  rect (aa,ab,ac,ad);

  fill (0,255,0);
  rect (ba, bb, bc, bd);

  fill (0,0,255);
  rect (ca,cb,cc,cd);
}

void keyPressed () {
  if (key == 'c') {
     fill (240);  
    noStroke();
    rect (0,0,width,height);
    stroke(0);
    strokeWeight (5);
    rect (width-width+10, height-height+10, width-20,250);

  }
}


