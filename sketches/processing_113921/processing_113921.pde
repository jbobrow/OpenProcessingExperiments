
int [] drei = {
  23, 20, 17, 14, 11, 8, 5, 2, 25, 19, 16, 13, 10, 7, 4, 1, 21, 18, 15, 12, 9, 6, 24, 0, 3, 22, 
  24, 23, 18, 15, 12, 9, 6, 3, 0, 25, 17, 14, 11, 8, 5, 2, 22, 19, 16, 13, 10, 7, 4, 21, 1, 20, 
  2, 24, 23, 16, 13, 10, 7, 4, 1, 21, 25, 15, 12, 9, 6, 3, 0, 20, 17, 14, 11, 8, 5, 19, 22, 18, 
  3, 0, 24, 23, 14, 11, 8, 5, 2, 22, 19, 25, 13, 10, 7, 4, 1, 21, 18, 15, 12, 9, 6, 17, 20, 16, 
  4, 1, 21, 24, 23, 12, 9, 6, 3, 0, 20, 17, 25, 11, 8, 5, 2, 22, 19, 16, 13, 10, 7, 15, 18, 14, 
  5, 2, 22, 19, 24, 23, 10, 7, 4, 1, 21, 18, 15, 25, 9, 6, 3, 0, 20, 17, 14, 11, 8, 13, 16, 12, 
  6, 3, 0, 20, 17, 24, 23, 8, 5, 2, 22, 19, 16, 13, 25, 7, 4, 1, 21, 18, 15, 12, 9, 11, 14, 10, 
  7, 4, 1, 21, 18, 15, 24, 23, 6, 3, 0, 20, 17, 14, 11, 25, 5, 2, 22, 19, 16, 13, 10, 9, 12, 8, 
  8, 5, 2, 22, 19, 16, 13, 24, 23, 4, 1, 21, 18, 15, 12, 9, 25, 3, 0, 20, 17, 14, 11, 7, 10, 6, 
  9, 6, 3, 0, 20, 17, 14, 11, 24, 23, 2, 22, 19, 16, 13, 10, 7, 25, 1, 21, 18, 15, 12, 5, 8, 4, 
  10, 7, 4, 1, 21, 18, 15, 12, 9, 24, 23, 0, 20, 17, 14, 11, 8, 5, 25, 22, 19, 16, 13, 3, 6, 2, 
  11, 8, 5, 2, 22, 19, 16, 13, 10, 7, 24, 23, 21, 18, 15, 12, 9, 6, 3, 25, 20, 17, 14, 1, 4, 0, 
  12, 9, 6, 3, 0, 20, 17, 14, 11, 8, 5, 24, 23, 19, 16, 13, 10, 7, 4, 1, 25, 18, 15, 22, 2, 21, 
  13, 10, 7, 4, 1, 21, 18, 15, 12, 9, 6, 3, 24, 23, 17, 14, 11, 8, 5, 2, 22, 25, 16, 20, 0, 19, 
  14, 11, 8, 5, 2, 22, 19, 16, 13, 10, 7, 4, 1, 24, 23, 15, 12, 9, 6, 3, 0, 20, 25, 18, 21, 17, 
  25, 12, 9, 6, 3, 0, 20, 17, 14, 11, 8, 5, 2, 22, 24, 23, 13, 10, 7, 4, 1, 21, 18, 16, 19, 15, 
  16, 25, 10, 7, 4, 1, 21, 18, 15, 12, 9, 6, 3, 0, 20, 24, 23, 11, 8, 5, 2, 22, 19, 14, 17, 13, 
  17, 14, 25, 8, 5, 2, 22, 19, 16, 13, 10, 7, 4, 1, 21, 18, 24, 23, 9, 6, 3, 0, 20, 12, 15, 11, 
  18, 15, 12, 25, 6, 3, 0, 20, 17, 14, 11, 8, 5, 2, 22, 19, 16, 24, 23, 7, 4, 1, 21, 10, 13, 9, 
  19, 16, 13, 10, 25, 4, 1, 21, 18, 15, 12, 9, 6, 3, 0, 20, 17, 14, 24, 23, 5, 2, 22, 8, 11, 7, 
  20, 17, 14, 11, 8, 25, 2, 22, 19, 16, 13, 10, 7, 4, 1, 21, 18, 15, 12, 24, 23, 3, 0, 6, 9, 5, 
  21, 18, 15, 12, 9, 6, 25, 0, 20, 17, 14, 11, 8, 5, 2, 22, 19, 16, 13, 10, 24, 23, 1, 4, 7, 3, 
  22, 19, 16, 13, 10, 7, 4, 25, 21, 18, 15, 12, 9, 6, 3, 0, 20, 17, 14, 11, 8, 24, 23, 2, 5, 1, 
  0, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 1, 22, 20, 18, 16, 14, 12, 10, 8, 6, 4, 2, 23, 24, 25, 
  1, 22, 20, 18, 16, 14, 12, 10, 8, 6, 4, 2, 0, 21, 19, 17, 15, 13, 11, 9, 7, 5, 3, 25, 23, 24, 
  15, 13, 11, 9, 7, 5, 3, 1, 22, 20, 18, 16, 14, 12, 10, 8, 6, 4, 2, 0, 21, 19, 17, 24, 25, 23,
};

int [] vier = {
  0, 4, 8, 12, 16, 23, 1, 5, 9, 13, 17, 25, 2, 6, 24, 14, 18, 22, 3, 7, 11, 15, 19, 20, 21, 10, 
  1, 5, 9, 13, 17, 21, 23, 6, 10, 14, 18, 22, 25, 7, 11, 24, 19, 0, 4, 8, 12, 16, 20, 2, 3, 15, 
  2, 6, 10, 14, 18, 22, 3, 23, 11, 15, 19, 0, 4, 25, 12, 16, 24, 1, 5, 9, 13, 17, 21, 7, 8, 20, 
  3, 7, 11, 15, 19, 0, 4, 8, 23, 16, 20, 1, 5, 9, 25, 17, 21, 24, 6, 10, 14, 18, 22, 12, 13, 2, 
  4, 8, 12, 16, 20, 1, 5, 9, 13, 23, 21, 2, 6, 10, 14, 25, 22, 3, 24, 11, 15, 19, 0, 17, 18, 7, 
  5, 9, 13, 17, 21, 2, 6, 10, 14, 18, 23, 3, 7, 11, 15, 19, 25, 4, 8, 24, 16, 20, 1, 22, 0, 12, 
  6, 10, 14, 18, 22, 3, 7, 11, 15, 19, 0, 23, 8, 12, 16, 20, 1, 25, 9, 13, 24, 21, 2, 4, 5, 17, 
  7, 11, 15, 19, 0, 4, 8, 12, 16, 20, 1, 5, 23, 13, 17, 21, 2, 6, 25, 14, 18, 24, 3, 9, 10, 22, 
  8, 12, 16, 20, 1, 5, 9, 13, 17, 21, 2, 6, 10, 23, 18, 22, 3, 7, 11, 25, 19, 0, 24, 14, 15, 4, 
  24, 13, 17, 21, 2, 6, 10, 14, 18, 22, 3, 7, 11, 15, 23, 0, 4, 8, 12, 16, 25, 1, 5, 19, 20, 9, 
  10, 24, 18, 22, 3, 7, 11, 15, 19, 0, 4, 8, 12, 16, 20, 23, 5, 9, 13, 17, 21, 25, 6, 1, 2, 14, 
  11, 15, 24, 0, 4, 8, 12, 16, 20, 1, 5, 9, 13, 17, 21, 2, 23, 10, 14, 18, 22, 3, 25, 6, 7, 19, 
  25, 16, 20, 24, 5, 9, 13, 17, 21, 2, 6, 10, 14, 18, 22, 3, 7, 23, 15, 19, 0, 4, 8, 11, 12, 1, 
  13, 25, 21, 2, 24, 10, 14, 18, 22, 3, 7, 11, 15, 19, 0, 4, 8, 12, 23, 20, 1, 5, 9, 16, 17, 6, 
  14, 18, 25, 3, 7, 24, 15, 19, 0, 4, 8, 12, 16, 20, 1, 5, 9, 13, 17, 23, 2, 6, 10, 21, 22, 11, 
  15, 19, 0, 25, 8, 12, 24, 20, 1, 5, 9, 13, 17, 21, 2, 6, 10, 14, 18, 22, 23, 7, 11, 3, 4, 16, 
  16, 20, 1, 5, 25, 13, 17, 24, 2, 6, 10, 14, 18, 22, 3, 7, 11, 15, 19, 0, 4, 23, 12, 8, 9, 21, 
  17, 21, 2, 6, 10, 25, 18, 22, 24, 7, 11, 15, 19, 0, 4, 8, 12, 16, 20, 1, 5, 9, 23, 13, 14, 3, 
  23, 22, 3, 7, 11, 15, 25, 0, 4, 24, 12, 16, 20, 1, 5, 9, 13, 17, 21, 2, 6, 10, 14, 18, 19, 8, 
  19, 23, 4, 8, 12, 16, 20, 25, 5, 9, 24, 17, 21, 2, 6, 10, 14, 18, 22, 3, 7, 11, 15, 0, 1, 13, 
  20, 1, 23, 9, 13, 17, 21, 2, 25, 10, 14, 24, 22, 3, 7, 11, 15, 19, 0, 4, 8, 12, 16, 5, 6, 18, 
  21, 2, 6, 23, 14, 18, 22, 3, 7, 25, 15, 19, 24, 4, 8, 12, 16, 20, 1, 5, 9, 13, 17, 10, 11, 0, 
  22, 3, 7, 11, 23, 19, 0, 4, 8, 12, 25, 20, 1, 24, 9, 13, 17, 21, 2, 6, 10, 14, 18, 15, 16, 5, 
  18, 0, 5, 10, 15, 20, 2, 7, 12, 17, 22, 4, 9, 14, 19, 1, 6, 11, 16, 21, 3, 8, 13, 23, 24, 25, 
  9, 14, 19, 1, 6, 11, 16, 21, 3, 8, 13, 18, 0, 5, 10, 15, 20, 2, 7, 12, 17, 22, 4, 24, 25, 23, 
  12, 17, 22, 4, 9, 14, 19, 1, 6, 11, 16, 21, 3, 8, 13, 18, 0, 5, 10, 15, 20, 2, 7, 25, 23, 24,
};

int c;
int d;
int f=26;
float x = 0;
float y = 0;
int h=676;
int z=0;


void setup() {
  size(780, 780);
  background(255);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, h, h, h);
}

void draw() {
  for (int i= 0; i < 780; i=i+30) {
    for (int j= 0; j < 780; j=j+30) {
      c= vier[z];
      x = lerp(c, f, f);
      fill(x, h, h);
      rect(i, j, 30, 30);
      d= drei[z];
      y = lerp(d, f, f);
      fill(y, h, h);
      rect(i+9, j+9, 12, 12);
      z=z+1;
    }
  }
  noLoop();
}


