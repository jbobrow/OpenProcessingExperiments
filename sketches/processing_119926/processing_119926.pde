
int [] eins = 
{
0,1,2,3,4,5,6,7,8,9,
1,2,0,4,6,3,5,9,7,8,
2,3,8,9,1,6,7,4,0,5,
3,8,1,6,0,9,2,5,4,7,
7,9,3,8,5,0,4,6,1,2,
6,4,9,2,3,7,0,8,5,1,
9,5,7,1,8,4,3,0,2,6,
4,7,5,0,9,2,8,1,6,3,
5,6,4,7,2,8,1,3,9,0,
8,0,6,5,7,1,9,2,3,4,
};

int [] zwei = 
{
0,1,2,3,4,5,6,7,8,9,
3,9,5,6,8,7,1,0,2,4,
6,8,7,5,9,4,0,1,3,2,
1,0,6,2,7,8,4,9,5,3,
8,2,4,1,3,6,9,5,0,7,
9,7,3,8,0,1,2,6,4,5,
4,6,9,7,2,3,5,8,1,0,
2,5,8,9,1,0,3,4,7,6,
7,3,0,4,5,9,8,2,6,1,
5,4,1,0,6,2,7,3,9,8,
};

int c;
int d;
int f=8;
float x = 0;
float y = 0;
float z = 0;
int h=87;
int m=0;

void setup() {
  size(300, 300);
  background(255);
  smooth(8);
  ellipseMode(CENTER);
  colorMode(HSB, h, h, h);
}

void draw() {
  for (int i= 0; i < 300; i=i+30) {
    for (int j= 0; j < 300; j=j+30) {
      c= eins[m];
      x = lerp(c, f, f);
      fill(x, h, h);
      rect(i, j, 30, 30);
      d= zwei[m];
      y = lerp(d, f, f);
      fill(y, h, h);
      rect(i+7, j+7, 17, 17);
      m=m+1;
    }
  }
  noLoop();
}


