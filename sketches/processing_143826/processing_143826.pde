
/////////////////////////// //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Don't use without permission
//
// Based on:
// #32 Parallel presences
// http://geometrydaily.tumblr.com/post/16865614417/32-parallel-presences-a-new-minimal-geometric
//
// Controls:
// MouseClick  - generate new position 
//
// Keys:
// UP   - add parallel 
// DOWN - remove parallel
// Z    - reduces the diameter
// X    - increases the diameter
//
/////////////////////////////////////////////////

int diam = 150;
int slices = 5;
PGraphics [] pg; 

void setup() {
  size(700, 700);
  pg = new PGraphics[slices];
  for (int i =0; i<pg.length; ++i) {
    pg [i] = createGraphics(((width-200)/pg.length), height-200);
  }
  noLoop();
  setPresences();
}


void draw() {
  background(235);
  fill(#3D3340);
  rect(100, 100, pg[0].width*pg.length, height-200);
//  rect(100, 100, width-200, height-200);
  int x =100;
  int step = (width-200)/pg.length;
  for (int i =0; i<pg.length; i++) {
    image(pg[i], x+i*step, 100);
    image(pg[i], x+i*step-1, 100); //for web
  }
  paper();
}


void setPresences() {
  for (int i =0; i<pg.length; ++i) {
    pg[i].beginDraw();
    pg[i].noStroke();
    pg[i].fill(#C185B2);   
    pg[i].ellipse(random(-diam/3, pg[i].width + diam/3), pg[i].height/2, diam, diam);
    pg[i].endDraw();
  }
}

void mousePressed() {
  for (int i =0; i<pg.length; ++i) {
    pg[i].clear();
  }
  setPresences();
  redraw();
}

void keyPressed() {
  int bf = slices;
  float bfd = diam;
  if (keyCode == UP) {
    slices++;
  }
  if (keyCode == DOWN) {
    slices--;
  }
  
  if (key == 'z') {
    diam-=10;
  }
  if (key == 'x') {
    diam+=10;
  }

  diam = constrain(diam, 30, 300);
  slices = constrain(slices, 1, 20);
  if (bf!=slices || bfd!=diam ) {
    pg = new PGraphics[slices];
    for (int i =0; i<pg.length; ++i) {
      pg [i] = createGraphics(((width-200)/pg.length), height-200);
    }
    setPresences();
    redraw();
  }
}

void paper() {
  strokeWeight(1); 
  noStroke();
  for (int i = 0; i<width-1; i+=2) {
    for (int j = 0; j<height-1; j+=2) {
      fill(random(235-40, 235+30), 25);
      rect(i, j, 2, 2);
    }
  }

  for (int i = 0; i<30; i++) {
    fill(random(60, 170), random(100, 170));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}

