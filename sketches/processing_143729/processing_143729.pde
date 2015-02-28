
///////////////////////////  //<>//
//                       //
//   -~=Manoylov AC=~-   //
//                       //
///////////////////////////
//
// Two circles of the lines. One in another. 
// 
// Don't use without permission
//
// Based on:
// #308 Twenty-five suns
// http://geometrydaily.tumblr.com/post/34901916113/308-twenty-five-suns-a-new-minimal-geometric
//
// Controls:
// MouseClick  - generate new position 
//
// Keys:
// UP   - add some rays 
// DOWN - remove some rays
// Z    - add gaps between rays
// X    - remove gaps between rays
//
/////////////////////////////////////////////////

PGraphics pg;
float limit = 360;
int [] angle = {0, 90, 180, 270};
float step = 2.8;

void setup() {
  pg = createGraphics(100, 100);
  size(700, 700);
  smooth();
  noLoop();

  strokeWeight(1);
  circleLine(0, pg.height, (int)dist(0, pg.height, pg.width, 0)*2, step, #dd2222);
  imageMode(CENTER);
}

void draw() {
  background(235);

  for (int i= 150; i<width-100; i+=100) {
    for (int j= 150; j<height-100; j+=100) {

      pushMatrix();
      translate(i, j);
      rotate(radians(angle[(int)random(0, 4)]));
      image(pg, 0, 0);
      popMatrix();
    }
  }    
  paper();
}



void circleLine(int cx, int cy, int r, float speed, color clbg) {
  float angle = 0.0;
  float scalar = r/2;       

  noStroke();
  fill(255);

  pg.beginDraw();
  pg.smooth(2);
  while (angle<= radians (limit)) {
    pg.stroke(clbg);
    float x = cx + cos(angle) * scalar;
    float y = cy + sin(angle) * scalar;
    pg.line(cx, cy, x, y);
    angle += radians(speed);
  }
  pg.endDraw();
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
    fill(random(130, 215), random(100, 170));
    rect(random(0, width-2), random(0, height-2), random(1, 3), random(1, 3));
  }
}



void mousePressed() {
  redraw();
}

void keyPressed() {
  if (keyCode == UP) {
    limit+=3.6;
  }
  if (keyCode == DOWN) {
    limit-=3.6;
  }
  if (key == 'z') {
    step-=1.4;
  }
  if (key == 'x') {
    step+=1.4;
  }


  step = constrain(step, 1.4, 35);
  limit = constrain(limit, 3.6, 360);

  pg.beginDraw();
  pg.clear();
  pg.endDraw();
  circleLine(0, pg.height, (int)dist(0, pg.height, pg.width, 0)*2, step, #dd2222);
  redraw();
}

