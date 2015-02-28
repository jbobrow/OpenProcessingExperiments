
/* Bouncing Balls
 By Zach Taher
 9/22/10
 */

int xCount = 500;
float[] xs = new float [500];
float[] ys= new float [500];
float[] rs = new float [500];
float[] gravitys = new float [500];
float[] dampings = new float [500];
float[] frictions = new float [500];
float[] spdXs = new float [500];
float[] spdYs = new float [500];
color[] cs = new color [500];
float stairCount = 6;
float xPos = 0;
float yPos = 250;
float stairX = 80;
float stairY = 600;
float stairHeight = yPos;

void assignVars() {
  for(int i = 0; i < xCount; i++) {
    xs[i] = 0;
    ys[i] = 0;
    rs[i] = random(2, 10);
    gravitys[i] = random(.5, .8);
    dampings[i] = random(.25, .8);
    frictions[i] = random(.25, .8);
    spdXs[i] = random(2, 8);
    spdYs[i] = random(2, 7);
    cs[i] = color(random(255), random(255), random(255));
  }
}
void setup() {
  size(600, 600);
  frameRate(30);
  smooth();
  drawStairs();
  assignVars();
}

void drawStairs() {
  for(int i = 0; i < stairCount; i++) {
    fill(178, 38, 38);
    noStroke();
    rect(xPos, yPos, stairX, stairY);
    xPos += 80;
    yPos += 60;
  }
  xPos = 0;
  yPos = 250;
}

void draw() {
  background(255);

  for(int i = 0; i < xCount; i++) {
  fill(cs[i]);
  ellipse(xs[i], ys[i], rs[i] * 2, rs[i] * 2);
  xs[i] += spdXs[i];
  spdYs[i] += gravitys[i];
  ys[i] += spdYs[i];

  if (xs[i] > width - rs[i]) {
    xs[i] = width - rs[i];
    spdXs[i] *= -1;
  }
  else if( xs[i] < rs[i]) {
    xs[i] = rs[i];
    spdXs[i] *= -1;
  }
  if (0 < xs[i] && xs[i] < 80 ) {

    if (ys[i] > 250 - rs[i]) {
      ys[i] = 250 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }

  if (80 < xs[i] && xs[i] < 160 ) {

    if (ys[i] > 310 - rs[i]) {
      ys[i] = 310 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  if (160 < xs[i] && xs[i] < 240 ) {

    if (ys[i] > 370 - rs[i]) {
      ys[i] = 370 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  if (240 < xs[i] && xs[i] < 320 ) {

    if (ys[i] > 430 - rs[i]) {
      ys[i] = 430 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  if (320 < xs[i] && xs[i] < 400 ) {

    if (ys[i] > 490 - rs[i]) {
      ys[i] = 490 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  if (400 < xs[i] && xs[i] < 400 ) {

    if (ys[i] > 490 - rs[i]) {
      ys[i] = 490 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  if (400 < xs[i] && xs[i] < 480) {

    if (ys[i] > 550 - rs[i]) {
      ys[i] = 550 - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  if (480 < xs[i] && xs[i] < width ) {

    if (ys[i] > height - rs[i]) {
      ys[i] = height - rs[i];
      spdYs[i] *= -1;
      spdYs[i] *= dampings[i];
      spdXs[i] *= frictions[i];
    }
  }
  
  if (250 < ys[i] && ys[i] < 310) {
    
    if(xs[i] < 80 - rs[i]){
    xs[i] = 80 - rs[i];
    spdXs[i] *= -1;
    }
  }
  
  if (310 < ys[i] && ys[i] < 370) {
    
    if (xs[i] < 160 - rs[i]) {
    xs[i] = 160 - rs[i];
    spdXs[i] *= -1;
    }
  }
  
  if (370 < ys[i] && ys[i] < 430) {
    
    if (xs[i] < 240 - rs[i]) {
    xs[i] = 240 - rs[i];
    spdXs[i] *= -1;
    }
  }
  
  if (430 < ys[i] && ys[i] < 490) {
   
   if (xs[i] < 300 - rs[i]) {
    xs[i] = 300 - rs[i];
    spdXs[i] *= -1;
   }
  }
  
  if (490 < ys[i] && ys[i] < 550) {
    if (xs[i] < 360 - rs[i]) {
    xs[i] = 360 - rs[i];
    spdXs[i] *= -1;
    }
  }
  
  if (550 < ys[i] && ys[i] < height) {
    if (xs[i] < 420 - rs[i]) {
      xs[i] = 420 - rs[i];
      spdXs[i] *= -1;
    }
  }
  drawStairs();
  }
}



