
int [] vier = 
{
  0, 1, 2, 3, 
  1, 0, 3, 2, 
  2, 3, 0, 1, 
  3, 2, 1, 0,
};

int [] drei = 
{
  0, 1, 2, 3, 
  3, 2, 1, 0, 
  1, 0, 3, 2, 
  2, 3, 0, 1,
};

int c;
int d;
int f=4;
float x = 0;
float y = 0;
int h=16;
int z=0;

void setup() {
  size(120, 120);
  background(255);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, h, h, h);
}

void draw() {
  for (int i= 0; i < 120; i=i+30) {
    for (int j= 0; j < 120; j=j+30) {
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



