

int colors=16;
int[][][] f; //this state, next state

int s=0; // actuall state
int dir=1; // next state
final int sz = 300;

void setup() {
  size(sz, sz);
  colorMode(HSB, colors);
  f= new int[width][height][2];
  for (int i=0; i< width;i++) 
    for (int j=0; j< height;j++)
      f[i][j][s]=(int)random(colors);
}

void draw() {
  for (int r=0; r < 1; r++) { 
    for (int i=0; i< width;i++) 
      for (int j=0; j< height;j++) {
        if (r==0) {
          stroke(f[i][j][s], colors, colors);
          point(i, j);
        }
        for (int x=-1; x< 2;x++) 
          for (int y=-1; y< 2;y++) {
            if (f[(i+x+width)%width][(j+y+height)%height][s] == (f[i][j][s]+1)%colors)
              f[i][j][dir]= (f[i][j][s]+1)%colors;
          }
      }
    dir= abs(dir-1);
    s= abs(s-1);
  }
}  

void mousePressed() {
  println(frameCount);
}



