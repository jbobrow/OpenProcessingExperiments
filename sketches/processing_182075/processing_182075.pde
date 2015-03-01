
float cx;
float cy;
float sx;
float sy;
float tx;
float ty;
float distance1;
float distance2;
color closerFill = color(0, 0, 220);
color fartherFill = color(255);
color cFill;
color rFill;

void setup() {
  size(200, 200);
  findCoffee();
}

void draw() {
}

void mousePressed() {
  findCoffee();
}

void findCoffee() {
  drawGrid();
  generateLocs();
  calculateDistances();
  getFillColors();
  drawLocs();
}

void drawLocs() {
  fill(cFill);
  ellipse(cx, cy, 10, 10);
  fill(rFill);
  rectMode(CENTER);
  rect(sx, sy, 10, 10);
  rectMode(CORNER);
  fill(0, 128, 0);
  triangle(tx-5, ty+5, tx, ty-5, tx+5, ty+5);
}

void getFillColors() {
  if (distance1<distance2) {//Sets fill colors depending on the closer distance.
    cFill = closerFill;
    rFill = fartherFill;
  } else {
    rFill = closerFill;
    cFill = fartherFill;
  }
}

void generateLocs() {//Generates locations of the two coffee houses and the person (triangle).
  cx = (round(random(10)))*20;//Generates a number between 0-10, rounds it, then multiplies by 20 to achieve values like 20,140,180,0,200,60, etc.
  cy = (round(random(10)))*20;
  sx = (round(random(10)))*20;
  sy = (round(random(10)))*20;
  tx = (round(random(10)))*20;
  ty = (round(random(10)))*20;
}

void calculateDistances() {
  distance1 = (abs(tx-cx) + abs(ty-cy))/20;//Calculates difference in blocks from the person to The Round Bean Coffeehouse (horizontal blocks difference + vertical blocks difference).
  distance2 = (abs(tx-sx) + abs(ty-sy))/20;//Calculates difference in blocks from the person to Square Deal Coffee (horizontal blocks difference + vertical blocks difference).
}

void drawGrid() {
  background(255);
  for (int i = 0; i<=200; i= i + 20) {//Draws rows.
    line(0, i, 200, i);
  }
  for (int i = 0; i<=200; i= i + 20) {//Draws columns.
    line(i, 0, i, 200);
  }
}



