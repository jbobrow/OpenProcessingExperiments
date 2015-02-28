
/*
This sketch is a study on how to reduce the scope when searching the grid's cells touched by a circle.
It's particuarly useful when working with particules or a huge number of moving elements.
On the other side, if the grid is too small, there is no more advantage to this technique.
Drawing a small grid will obviously slow down the system!

This version is using 3D.

Written by frankiezafe, 29/0/2012
http://www.frankiezafe.org
*/
int windowsize = 600;
int gridsize = 20;
float cellgap;
float[] occupation = new float[gridsize*gridsize*gridsize];

float[] ccenter = {0,0, windowsize * 0.5f};
float csize;
int ccreationstatus = 0;

float[][] particules = new float[2000][7]; // x,y,z position, x,y,z speed, grid index

boolean drawgrid = true;

void setup() {
  size(600,600, P3D);
  noSmooth();
  cellgap = windowsize * 1.f / gridsize;
  for (int i=0; i < particules.length; i++) {
    particules[i][0] = random(windowsize);
    particules[i][1] = random(windowsize);
    particules[i][2] = random(windowsize);
    particules[i][3] = random(-1,1);
    particules[i][4] = random(-1,1);
    particules[i][5] = random(-1,1);
    // all same speed:
    float l = sqrt( pow(particules[i][3], 2) + pow(particules[i][4], 2) + pow(particules[i][5], 2) );
    particules[i][3] /= l;
    particules[i][4] /= l;
    particules[i][5] /= l;
    particules[i][6] = -1;
  }
}

void draw() {

  background(255);
  // once center is drawn, calculation on the fly
  if (ccreationstatus == 1 || ccreationstatus == 2) {
    if (ccreationstatus == 1)
      csize = dist(ccenter[0], ccenter[1], ccenter[2], mouseX, mouseY, ccenter[2]);
    else {
      ccenter[2] = mouseX;
      if (ccenter[2] < 0)
        ccenter[2] = 0;
      else if (ccenter[2] > windowsize)
        ccenter[2] = windowsize;
    }
    resetGrid();
    attackGrid();
  }
  translate(300, 300, -450);
  rotateX(frameCount * 0.009f);
  rotateY(-frameCount * 0.0067f);
  // translate(300,0,0);
  // rotateY(-0.4);
  translate(-300, -300, -300);
  // drawing the grid
  if (drawgrid) {
    noFill();
    noStroke();
    // stroke(0);
    float gx = 0;
    float gy = 0;
    float gz = 0;
    int i = 0;
    
    pushMatrix();
    for (int l = 0; l < gridsize; l++) {
      pushMatrix();
      translate(0,0, gz);
      for (int r = 0; r < gridsize; r++) {
        for (int c = 0; c < gridsize; c++) {
          if (occupation[i] > 0) {
            fill( 0, 50 + 205 * occupation[i], 0, 15 );
          } else {
            fill( 50, 5);
          }
          rect(gx,gy,cellgap,cellgap);
          gx += cellgap;
          i++;
        }
        gx = 0;
        gy += cellgap;
      }
      gy = 0;
      gz += cellgap;
      popMatrix();
    }
    popMatrix();
    
  } else {
    noFill();
    // selection plane
    if (ccreationstatus == 1 || ccreationstatus == 2) {
      pushMatrix();
      if (ccreationstatus == 2)
        stroke(255,125,0);
      else
        stroke(0);
      translate(0,0, ccenter[2]);
      rect(0,0,windowsize, windowsize);
      popMatrix();
    }
    stroke(150);
    pushMatrix();
    line(0,0,windowsize,0);
    line(0,0,0,windowsize);
    line(0,windowsize,windowsize,windowsize);
    line(windowsize,windowsize,windowsize,0);
    popMatrix();
    pushMatrix();
    translate(0,0,windowsize);
    line(0,0,windowsize,0);
    line(0,0,0,windowsize);
    line(0,windowsize,windowsize,windowsize);
    line(windowsize,windowsize,windowsize,0);
    popMatrix();
    line(0,0,0,0,0,windowsize);
    line(0,windowsize,0,0,windowsize,windowsize);
    line(windowsize,0,0,windowsize,0,windowsize);
    line(windowsize,windowsize,0,windowsize,windowsize,windowsize);
    
  }
  if (ccreationstatus == 1) {
    pushMatrix();
    translate(ccenter[0], ccenter[1], ccenter[2]);
    noFill();
    stroke(255,0,0);
    line(-5,0,0,5,0,0);
    line(0,-5,0,0,5,0);
    line(0,0,-5,0,0,5);
    stroke(255,123,0);
    line(0, 0, 0, mouseX - ccenter[0], mouseY - ccenter[1], 0);
    float tmps = dist(ccenter[0], ccenter[1], mouseX, mouseY);
    ellipse( 0, 0, tmps*2,tmps*2);
    popMatrix();
    pushMatrix();
    translate(ccenter[0], ccenter[1], ccenter[2]);
    rotateX(PI * 0.5f);
    ellipse(0, 0,tmps*2,tmps*2);
    rotateY(PI * 0.5f);
    ellipse(0, 0,tmps*2,tmps*2);
    popMatrix();
  } else if (ccreationstatus == 2) {
    noFill();
    stroke(255,0,0);
    pushMatrix();
    translate(0,0, ccenter[2]);
    ellipse(ccenter[0], ccenter[1],csize*2,csize*2);
    pushMatrix();
    translate(ccenter[0], ccenter[1]);
    rotateX(PI * 0.5f);
    ellipse(0, 0,csize*2,csize*2);
    rotateY(PI * 0.5f);
    ellipse(0, 0,csize*2,csize*2);
    popMatrix();
    popMatrix();
  }
  // drawing particules
  drawParticules();
}

void drawParticules() {
  float occ = 0;
  float es = 2;
  int gridc = 0;
  int gridr = 0;
  int gridl = 0;
  for (int i=0; i < particules.length; i++) {
    particules[i][0] += particules[i][3];
    particules[i][1] += particules[i][4];
    particules[i][2] += particules[i][5];
    while (particules[i][0] < 0)
      particules[i][0] += windowsize;
    while (particules[i][0] > windowsize)
      particules[i][0] -= windowsize;
    while (particules[i][1] < 0)
      particules[i][1] += windowsize;
    while (particules[i][1] > windowsize)
      particules[i][1] -= windowsize;
    while (particules[i][2] < 0)
      particules[i][2] += windowsize;
    while (particules[i][2] > windowsize)
      particules[i][2] -= windowsize;
    // place in the grid
    gridc = round( (particules[i][0] - cellgap * 0.5f) / cellgap );
    if (gridc >= gridsize)
      gridc = gridsize-1;
    gridr = round( (particules[i][1] - cellgap * 0.5f) / cellgap );
    if (gridr >= gridsize)
      gridr = gridsize-1;
    gridl = round( (particules[i][2] - cellgap * 0.5f) / cellgap );
    if (gridl >= gridsize)
      gridl = gridsize-1;
    particules[i][6] = gridc + gridr * gridsize + gridl * gridsize * gridsize;
    occ = occupation[ (int) particules[i][6] ];
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
    pushMatrix();
    translate(particules[i][0], particules[i][1], particules[i][2]);
    ellipse(0, 0, es, es);
    rotateX(PI * 0.5f);
    ellipse(0, 0, es, es);
    rotateY(PI * 0.5f);
    ellipse(0, 0, es, es);
    popMatrix();
  }
}

void resetGrid() {
  for (int i=0; i<gridsize*gridsize*gridsize; i++)
    occupation[i] = 0;
}

void attackGrid() {
  // locate center
  int gridc = round( (ccenter[0] - cellgap * 0.5f) / cellgap );
  int gridr = round( (ccenter[1] - cellgap * 0.5f) / cellgap );
  int gridl = round( (ccenter[2] - cellgap * 0.5f) / cellgap );
  // area to investigate:
  int area = ceil( csize / cellgap );
  int i = 0;
  for ( int l = gridl - area; l <= gridl + area; l++ ) {
    if ( l < 0 || l >= gridsize)
         continue;
    for ( int r = gridr - area; r <= gridr + area; r++ ) {
      if ( r < 0 || r >= gridsize)
           continue;
       for ( int c = gridc - area; c <= gridc + area; c++ ) {
         if ( c < 0 || c >= gridsize)
           continue;
         i = c + r * gridsize + l * gridsize * gridsize;
         occupation[i] = cellInCircle(c,r,l);
       }
    }
  }
}

float cellInCircle(int gridc, int gridr, int gridl) {
  
  float c1x = (gridc * cellgap);
  float c1y = (gridr * cellgap);
  float c1z = (gridl * cellgap);
  float c2x = (gridc * cellgap) + cellgap;
  float c2y = (gridr * cellgap) + cellgap;
  float c2z = (gridl * cellgap) + cellgap;
  
  float dtopleftfront = dist(ccenter[0], ccenter[1], ccenter[2], c1x, c1y, c1z);
  float dtoprightfront = dist(ccenter[0], ccenter[1], ccenter[2], c2x, c1y, c1z);
  float dbottomrightfront = dist(ccenter[0], ccenter[1], ccenter[2], c2x, c2y, c1z);
  float dbottomleftfront = dist(ccenter[0], ccenter[1], ccenter[2], c1x, c2y, c1z);
  
  float dtopleftback = dist(ccenter[0], ccenter[1], ccenter[2], c1x, c1y, c2z);
  float dtoprightback = dist(ccenter[0], ccenter[1], ccenter[2], c2x, c1y, c2z);
  float dbottomrightback = dist(ccenter[0], ccenter[1], ccenter[2], c2x, c2y, c2z);
  float dbottomleftback = dist(ccenter[0], ccenter[1], ccenter[2], c1x, c2y, c2z);
  
  float pc = 0;
  if (dtopleftfront < csize)
   pc += 0.125f;
  if (dtoprightfront < csize)
   pc += 0.125f;
  if (dbottomrightfront < csize)
   pc += 0.125f; 
  if (dbottomleftfront < csize)
   pc += 0.125f;
  if (dtopleftback < csize)
   pc += 0.125f;
  if (dtoprightback < csize)
   pc += 0.125f;
  if (dbottomrightback < csize)
   pc += 0.125f; 
  if (dbottomleftback < csize)
   pc += 0.125f;
  return pc;
  
}

void mousePressed() {
  if (ccreationstatus != 1 && ccreationstatus != 2) {
    ccenter[0] = mouseX;
    ccenter[1] = mouseY;
    ccreationstatus = 1;
    resetGrid();
  } else if (ccreationstatus == 1) {
    csize = dist(ccenter[0], ccenter[1], mouseX, mouseY);
    ccreationstatus = 2;
  } else if (ccreationstatus == 2) {
    ccenter[2] = mouseX;
    if (ccenter[2] < 0)
      ccenter[2] = 0;
    else if (ccenter[2] > windowsize)
      ccenter[2] = windowsize;
    ccreationstatus = 3;
  }
  // attackGrid();
}

void keyReleased() {
  // println(keyCode);
  if (keyCode == 38) { // arrow up
    gridsize ++;
    if (gridsize > 60)
      gridsize = 60;
    cellgap = windowsize * 1.f / gridsize;
    occupation = new float[gridsize*gridsize*gridsize];
    if (ccreationstatus == 2) {
      resetGrid();
      attackGrid();
    }
  } else if (keyCode == 40) { // arrow down
    gridsize --;
    if (gridsize < 2)
      gridsize = 2;
    cellgap = windowsize * 1.f / gridsize;
    occupation = new float[gridsize*gridsize*gridsize];
    if (ccreationstatus == 2) {
      resetGrid();
      attackGrid();
    }
  } else if (keyCode == 72) {
    drawgrid = !drawgrid;
  }
}

