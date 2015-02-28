
Grid[][] grid;

int rand = 20;
int width = 400;
int height = 400;
int tile = 20;
int dir;
int numx = (width-rand)/tile;
int numy = (height-rand)/tile;
int posx, posy;
float distMax;

void setup() {
  size(400, 400); 
  distMax = sqrt(sq(width-rand) + sq(height-rand));
  println(distMax);
  background(0);
  smooth();
  noStroke();
  strokeCap(PROJECT);
  rectMode(CENTER);
  grid = new Grid[numx][numy];
  for (int i=0; i<numy; i++) {
    for (int j=0; j<numx; j++) {
      grid[j][i] = new Grid(j, i);
    }
  }
}

void draw() {
  fill(0, 50);
  rect(width/2, height/2, width, height);

  for (int i=0; i<numy; i++) {
    for (int j=0; j<numx; j++) {

      grid[j][i].drawMe();
    }
  }
}





