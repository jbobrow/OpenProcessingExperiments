
int [] vier = 
{
  0, 1, 2, 3, 4, 
  1, 2, 3, 4, 0, 
  2, 3, 4, 0, 1, 
  3, 4, 0, 1, 2, 
  4, 0, 1, 2, 3,
};

int [] drei = 
{
  0, 1, 2, 3, 4, 
  3, 4, 0, 1, 2, 
  1, 2, 3, 4, 0, 
  4, 0, 1, 2, 3, 
  2, 3, 4, 0, 1,
};

int c;
int d;
int f=5;
float x = 0;
float y = 0;
int h=25;
int z=0;

void setup() {
  size(150, 150);
  background(255);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, h, h, h);
}

void draw() {
  for (int i= 0; i < 150; i=i+30) {
    for (int j= 0; j < 150; j=j+30) {
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



