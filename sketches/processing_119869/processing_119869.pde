
int [] eins = 
{
0,1,2,3,4,5,6,7,8,9,
1,2,0,4,3,8,7,9,5,6,
5,6,9,0,7,3,4,8,1,2,
9,8,7,5,6,4,0,1,2,3,
3,7,5,9,8,1,2,6,4,0,
7,5,1,8,2,6,9,3,0,4,
2,4,8,7,1,9,3,0,6,5,
8,9,6,1,0,2,5,4,3,7,
6,3,4,2,9,0,1,5,7,8,
4,0,3,6,5,7,8,2,9,1,
};

int [] zwei = 
{
0,1,2,3,4,5,6,7,8,9,
7,4,8,0,5,9,2,3,6,1,
4,2,5,9,3,7,8,1,0,6,
6,0,4,7,9,1,3,8,5,2,
9,6,1,8,2,4,0,5,3,7,
1,3,9,6,7,8,4,0,2,5,
8,9,3,5,6,2,1,4,7,0,
5,7,0,2,1,3,9,6,4,8,
3,8,7,1,0,6,5,2,9,4,
2,5,6,4,8,0,7,9,1,3,
};

int c;
int d;
int f=8;
float x = 0;
float y = 0;
float z = 0;
int h=100;
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


