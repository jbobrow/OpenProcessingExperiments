
int [] drei = 
{
  0, 2, 4, 6, 1, 3, 5, 
  6, 1, 3, 5, 0, 2, 4, 
  5, 0, 2, 4, 6, 1, 3, 
  4, 6, 1, 3, 5, 0, 2, 
  3, 5, 0, 2, 4, 6, 1, 
  2, 4, 6, 1, 3, 5, 0, 
  1, 3, 5, 0, 2, 4, 6,
};

int [] vier = 
{
  0, 1, 2, 3, 4, 5, 6, 
  6, 0, 1, 2, 3, 4, 5, 
  5, 6, 0, 1, 2, 3, 4, 
  4, 5, 6, 0, 1, 2, 3, 
  3, 4, 5, 6, 0, 1, 2, 
  2, 3, 4, 5, 6, 0, 1, 
  1, 2, 3, 4, 5, 6, 0,
};

int c;
int d;
int f=7;
float x = 0;
float y = 0;
int h=49;
int z=0;

void setup() {
  size(210, 210);
  background(255);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, h, h, h);
}

void draw() {
  for (int i= 0; i < 210; i=i+30) {
    for (int j= 0; j < 210; j=j+30) {
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



