
int c;
int h=45;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(180, 180);
  background(0);
  smooth(8);
  textFont(f, 17);
}

int [] m =
{
1,9,34,33,32,2,
10,11,24,25,14,27,
29,18,21,20,15,8,
30,22,17,16,19,7,
6,23,12,13,26,31,
35,28,3,4,5,36,
};



void draw() {
  for (int j= 0; j < 180; j=j+30) {
    for (int i= 0; i < 180; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+2, i+22);
      z=z+1;
    }
  }z=0;
}


