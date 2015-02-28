
int x1, y1, x2, y2;
int velx1, vely1, velx2, vely2;
int i, j;
int gridcolorred, gridcolorblue, gridcolorgreen;
int bigballcolorred, bigballcolorgreen, bigballcolorblue;
int smallballcolorred, smallballcolorgreen, smallballcolorblue;
int cellsize;
int theradius;

void setup() {
  size(800, 800);
  x1=100;
  y1=100;
  x2=500;
  y2=500;
  velx1=5;
  vely1=3;
  velx2=3;
  vely2=8;
  i=0;
  j=0;
  gridcolorred=255;
  gridcolorgreen=255;
  gridcolorblue=255;
  bigballcolorred=255;
  bigballcolorgreen=255;
  bigballcolorblue=255;
  smallballcolorred=255;
  smallballcolorgreen=255;
  smallballcolorblue=255;
  cellsize=100;
  smooth();
}

void draw() {
  theradius=cellsize/2;
  //background
  fill(150);
  rect(0, 0, width, height);
  //circles on background
  fill(gridcolorred, gridcolorgreen, gridcolorblue);
  for (i=0;i<((800/cellsize)+1);i++) {
    for (j=0;j<((800/cellsize)+1);j++) {
      ellipse(cellsize*i+theradius,cellsize*j+theradius, cellsize, cellsize);
    }
  }
  fill(smallballcolorred, smallballcolorgreen, smallballcolorblue);
  ellipse(x1, y1, 100, 100);
  fill(bigballcolorred, bigballcolorgreen, bigballcolorblue);
  ellipse(x2, y2, 300, 300);
  x1 += velx1;
  y1 += vely1;
  x2 += velx2;
  y2 += vely2;
  if (x1 > width-50 || x1 < 50) {
    velx1 *= -1;
    gridcolorred=int(random(255));
    gridcolorgreen=int(random(255));
    gridcolorblue=int(random(255));
    smallballcolorred=int(random(255));
    smallballcolorgreen=int(random(255));
    smallballcolorblue=int(random(255));
    cellsize=int(random(50, 150));
  }
  if (y1 > width-50 || y1 < 50) {
    vely1 *= -1;
    gridcolorred=int(random(255));
    gridcolorgreen=int(random(255));
    gridcolorblue=int(random(255));
    smallballcolorred=int(random(255));
    smallballcolorgreen=int(random(255));
    smallballcolorblue=int(random(255));
    cellsize=int(random(50, 150));
  }
  if (x2 > width-150 || x2 < 150) {
    velx2 *= -1;
    gridcolorred=int(random(255));
    gridcolorgreen=int(random(255));
    gridcolorblue=int(random(255));
    bigballcolorred=int(random(255));
    bigballcolorgreen=int(random(255));
    bigballcolorblue=int(random(255));
    cellsize=int(random(50, 150));
  }
  if (y2 > width-150 || y2 < 150) {
    vely2 *= -1;
    gridcolorred=int(random(255));
    gridcolorgreen=int(random(255));
    gridcolorblue=int(random(255));
    bigballcolorred=int(random(255));
    bigballcolorgreen=int(random(255));
    bigballcolorblue=int(random(255));
    cellsize=int(random(50, 150));
  }
}

