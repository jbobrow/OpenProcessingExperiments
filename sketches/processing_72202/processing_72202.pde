
/*
This sketch is a study on how to reduce the scope when searching the grid's cells touched by a circle.
It's particuarly useful when working with particules or a huge number of moving elements.
On the other side, if the grid is too small, there is no more advantage to this technique.
Drawing a small grid will obviously slow down the system!

Written by frankiezafe, 27/0/2012
http://www.frankiezafe.org
*/

int gridsize = 40;
float cellgap;
float[] occupation = new float[gridsize*gridsize];

float[] ccenter = {0,0};
float csize;
int ccreationstatus = 0;

float[][] particules = new float[2000][5]; // x,y position, x,y speed, grid index

int windowsize = 600;
boolean drawgrid = true;

void setup() {
  size(600,600);
  cellgap = windowsize * 1.f / gridsize;
  for (int i=0; i < particules.length; i++) {
    particules[i][0] = random(windowsize);
    particules[i][1] = random(windowsize);
    particules[i][2] = random(-1,1);
    particules[i][3] = random(-1,1);
    // all same speed:
    float l = sqrt( pow(particules[i][2], 2) + pow(particules[i][3], 2) );
    particules[i][2] /= l;
    particules[i][3] /= l;
    particules[i][4] = -1;
  }
}

void draw() {

  background(255);
  // once center is drawn, calculation on the fly
  if (ccreationstatus == 1) {
    csize = dist(ccenter[0], ccenter[1], mouseX, mouseY);
    resetGrid();
    attackGrid();
  }
  // drawing the grid
  if (drawgrid) {
    noFill();
    stroke(0);
    float gx = 0;
    float gy = 0;
    int i = 0;
    for (int r = 0; r < gridsize; r++) {
      for (int c = 0; c < gridsize; c++) {
        if (occupation[i] > 0)
          fill( 50 + 205 * occupation[i] );
        else
          fill(50);
        rect(gx,gy,cellgap,cellgap);
        gx += cellgap;
        i++;
      }
      gx = 0;
      gy += cellgap;
    }
  }
  if (ccreationstatus == 1) {
    pushMatrix();
    translate(ccenter[0], ccenter[1]);
    noFill();
    stroke(255,0,0);
    line(-5,0,5,0);
    line(0,-5,0,5);
    popMatrix();
    stroke(255,123,0);
    line(ccenter[0], ccenter[1], mouseX, mouseY);
    float tmps = dist(ccenter[0], ccenter[1], mouseX, mouseY);
    ellipse(ccenter[0], ccenter[1],tmps*2,tmps*2);
  } else if (ccreationstatus == 2) {
    noFill();
    stroke(255,0,0);
    ellipse(ccenter[0], ccenter[1],csize*2,csize*2);
  }
  // drawing particules
  drawParticules();
}

void drawParticules() {
  float occ = 0;
  float es = 2;
  int gridc = 0;
  int gridr = 0;
  for (int i=0; i < particules.length; i++) {
    particules[i][0] += particules[i][2];
    particules[i][1] += particules[i][3];
    while (particules[i][0] < 0)
      particules[i][0] += windowsize;
    while (particules[i][0] > windowsize)
      particules[i][0] -= windowsize;
    while (particules[i][1] < 0)
      particules[i][1] += windowsize;
    while (particules[i][1] > windowsize)
      particules[i][1] -= windowsize;
    // place in the grid
    gridc = round( (particules[i][0] - cellgap * 0.5f) / cellgap );
    if (gridc >= gridsize)
      gridc = gridsize-1;
    gridr = round( (particules[i][1] - cellgap * 0.5f) / cellgap );
    if (gridr >= gridsize)
      gridr = gridsize-1;
    particules[i][4] = gridc + gridr * gridsize;
    occ = occupation[ (int) particules[i][4] ];
    fill(0);
    noStroke();
    es = 2;
    if (occ == 1) {
      fill(255,0,0);
      es = 4;
    } else if (occ > 0) {
      fill(255,125,0);
      es = 3;  
    }
    ellipse(particules[i][0], particules[i][1], es, es);
  }
}

void resetGrid() {
  for (int i=0; i<gridsize*gridsize; i++)
    occupation[i] = 0;
}

void attackGrid() {
  // locate center
  int gridc = round( (ccenter[0] - cellgap * 0.5f) / cellgap );
  int gridr = round( (ccenter[1] - cellgap * 0.5f) / cellgap );
  // area to investigate:
  int area = ceil( csize / cellgap );
  int i = 0;
  for ( int r = gridr - area; r <= gridr + area; r++ ) {
    if ( r < 0 || r >= gridsize)
         continue;
     for ( int c = gridc - area; c <= gridc + area; c++ ) {
       if ( c < 0 || c >= gridsize)
         continue;
       i = c + r * gridsize;
       occupation[i] = cellInCircle(c,r);
     }
  }
}

float cellInCircle(int gridc, int gridr) {
  float c1x = (gridc * cellgap);
  float c1y = (gridr * cellgap);
  float c2x = (gridc * cellgap) + cellgap;
  float c2y = (gridr * cellgap) + cellgap;
  float dtopleft = dist(ccenter[0], ccenter[1], c1x, c1y);
  float dtopright = dist(ccenter[0], ccenter[1], c2x, c1y);
  float dbottomright = dist(ccenter[0], ccenter[1], c2x, c2y);
  float dbottomleft = dist(ccenter[0], ccenter[1], c1x, c2y);
  float pc = 0;
  if (dtopleft < csize)
   pc += 0.25f;
  if (dtopright < csize)
   pc += 0.25f;
  if (dbottomright < csize)
   pc += 0.25f; 
  if (dbottomleft < csize)
   pc += 0.25f;
  return pc;
}

void mousePressed() {
  if (ccreationstatus != 1) {
    ccenter[0] = mouseX;
    ccenter[1] = mouseY;
    ccreationstatus = 1;
    resetGrid();
  } else if (ccreationstatus == 1) {
    csize = dist(ccenter[0], ccenter[1], mouseX, mouseY);
    ccreationstatus = 2;
    attackGrid();
  }
}

void keyReleased() {
  // println(keyCode);
  if (keyCode == 38) { // arrow up
    gridsize ++;
    if (gridsize > 200)
      gridsize = 200;
    cellgap = windowsize * 1.f / gridsize;
    occupation = new float[gridsize*gridsize];
    if (ccreationstatus == 2) {
      resetGrid();
      attackGrid();
    }
  } else if (keyCode == 40) { // arrow down
    gridsize --;
    if (gridsize < 2)
      gridsize = 2;
    cellgap = windowsize * 1.f / gridsize;
    occupation = new float[gridsize*gridsize];
    if (ccreationstatus == 2) {
      resetGrid();
      attackGrid();
    }
  } else if (keyCode == 72) {
    drawgrid = !drawgrid;
  }
}

