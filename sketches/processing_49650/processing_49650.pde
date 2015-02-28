


class p2 {
  float x;
  float y;
}

int rows = 11;
int cols = 9;
float xvariance = 0.02;
float yvariance = 0.02;

p2 grid[][] = new p2[rows][cols];


void setup() {
  size(600,600);

  stroke(0,100);
  smooth();
  noFill();
  makeGrid();
  frameRate(0.25);
}

void makeGrid() {
  for(int r=0; r<rows; r++) {
    float rowMean = (height / (rows-1)) * r;// (r+1) - 0.5*(height / rows);
    for(int c=0; c<cols; c++) {
      float colMean = (width / (cols-1)) * c;
      grid[r][c] = new p2();
      grid[r][c].x = colMean + random(-xvariance*height, xvariance*height);
      grid[r][c].y = rowMean + random(-yvariance*height, yvariance*height);
      
      // fix boundary cases (straight lines)
      if(c == 0)
        grid[r][c].x = 0;
      if(c == (cols-1))
        grid[r][c].x = width-1;
        
      if(r == 0)
        grid[r][c].y = 0;
      if(r == (rows-1))
        grid[r][c].y = height-1;
    }
  }
}

void draw() {

  makeGrid();

  background(255);
  line(0,0,0,height);
  line(width-1,0, width-1,height);
  drawGrid();
  drawCircles();
  drawLines();

}

void drawLines() {
  for(int r=0; r<rows-1; r++) {
    for(int c=0; c<cols-1; c++) {
      int dice = int(random(0,4));
      if(dice == 0 || dice == 1)
        drawLineBunch(grid[r][c], grid[r][c+1], grid[r+1][c], grid[r+1][c+1], int(random(6,40)), dice);
    }
  }
}

void drawLineBunch(p2 ul, p2 ur, p2 ll, p2 lr, int n, int type) {
  int nnodes = 13;
  float xorigins[] = new float[nnodes];
  float xdestinations[] = new float[nnodes];
  for(int i=0; i<nnodes; i++) {
    xorigins[i] = random(ul.x, ur.x);
    xdestinations[i] = random(ll.x, lr.x);
  }
  for(int i=0; i<n; i++) {
    int dice = int(random(0, nnodes));
    float ox = xorigins[dice];
    float dx = type == 0 ? xorigins[dice] : xdestinations[dice];
    float oy = map(ox, ul.x, ur.x, ul.y, ur.y);
    float dy = map(dx, ll.x, lr.x, ll.y, lr.y);
    line(ox,oy,dx,dy);
  }
}

void drawCircles() {
  for(int i=0; i<8; i++) {
    float diam = (width/60.0) * (i+1);
    diam += random(-diam*0.05,diam*0.05);
    ellipse(random(diam*0.5,width-diam*0.5), random(diam*0.5, height-diam*0.5), diam, diam);
  }
}

void drawGrid() {
  for(int r=0; r<rows; r++) {
    for(int c=0; c<cols-1; c++) {
      p2 p0 = grid[r][c];
      p2 p1 = grid[r][c+1];      
      line(p0.x,p0.y,p1.x,p1.y);
    }
  }
}

void mouseClicked() {
  redraw();
}

void keyPressed() {

  if(key == 'q') {
  exit();
  }
}
