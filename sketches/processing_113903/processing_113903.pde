
int [] vier = 
{
  0, 1, 2, 3, 4, 5, 6, 7, 
  6, 5, 7, 4, 3, 1, 0, 2, 
  7, 3, 6, 1, 5, 4, 2, 0, 
  1, 0, 4, 7, 2, 6, 5, 3, 
  2, 4, 0, 5, 1, 3, 7, 6, 
  3, 7, 5, 0, 6, 2, 4, 1, 
  4, 2, 1, 6, 0, 7, 3, 5, 
  5, 6, 3, 2, 7, 0, 1, 4,
};

int [] drei = 
{
  0, 1, 2, 3, 4, 5, 6, 7, 
  7, 3, 6, 1, 5, 4, 2, 0, 
  1, 0, 4, 7, 2, 6, 5, 3, 
  2, 4, 0, 5, 1, 3, 7, 6, 
  3, 7, 5, 0, 6, 2, 4, 1, 
  4, 2, 1, 6, 0, 7, 3, 5, 
  5, 6, 3, 2, 7, 0, 1, 4, 
  6, 5, 7, 4, 3, 1, 0, 2,
};

int c;
int d;
int f=8;
float x = 0;
float y = 0;
int h=64;
int z=0;

void setup() {
  size(240, 240);
  background(255);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, h, h, h);
}

void draw() {
  for (int i= 0; i < 240; i=i+30) {
    for (int j= 0; j < 240; j=j+30) {
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



