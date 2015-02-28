
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #46 Movement
// http://geometrydaily.tumblr.com/post/17658735008/46-movement-a-new-minimal-geometric-composition
//
// Controls:
// MouseClick  - redraw 
//
// Keys:
// A     - reduces   the max height of the block
// S     - increases the max height of the block
// Q     - reduces   the min height of the block
// W     - increases the min height of the block
// P     - on/off paper  (turn off if you want to run faster)
// Space - set defoult setting

/////////////////////////////////////////////////
import java.lang.Integer;

int sz = 700;
int anglVar = 2;
int border = 100;
int avaibleSpace = sz-border*2;
int widthRect = sz-border*2;
boolean pap = true; 
int [] rndm = { avaibleSpace/50, avaibleSpace/3 };
int [] rot = {  0, 0, 0, 0, 1, 1, 1, 2, 2, 1, 3, 2, 0, 0 }; 
ArrayList <Float> movements = new ArrayList<Float>();

void setup() {
  size(sz, sz);
  rectMode(CENTER);
  noStroke();
  noLoop();
  initList(avaibleSpace);
}

void draw() {
  background(235);
  if(pap){ paper(35); }

  int pos = border;
  float angle = 0;
  for (Float i : movements) {
    fill(0, 220); 
    pushMatrix();
    translate(sz/2, (i+pos*2)/2);
    //    angle = rot[(int)(random(1, rot.length))-1];
    angle = (random(-anglVar, anglVar));
    rotate(radians(angle));
    rect(0, 0, widthRect, i);
    pos += i;
    popMatrix();
  }

  if(pap){ paper(15); }
}

void mousePressed() {
  initList(avaibleSpace);
  redraw();
}

void keyPressed() {
  if (key == 'q') {
    rndm[0]-=20;
  }
  if (key == 'w') {
    rndm[0]+=20;
  }
  if (key == 'a') {
    rndm[1]-=20;
  }
  if (key == 's') {
    rndm[1]+=20;
  }
  if (key == ' ') {
    rndm [0] = avaibleSpace/50;
    rndm [1] = avaibleSpace/3;
  }
  if (key == 'p') {
    pap = !pap;
  }

  rndm[0] = constrain(rndm[0], 10, rndm[1]-20);
  rndm[1] = constrain(rndm[1], rndm[0]+30, sz);
  initList(avaibleSpace);
  redraw();
}

void paper(int in_val) {
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), in_val);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(in_val*2.5, in_val*3));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

void initList(int in_val) {
  float buf =0;
  movements = new ArrayList<Float>();

  for (int i =0; i < in_val ; ) {
    i += buf = round(random(rndm[0], rndm[1]));
    if (i>in_val) {
      movements.add(in_val-(i-buf));
      break;
    }
    movements.add(buf);
  }
}

