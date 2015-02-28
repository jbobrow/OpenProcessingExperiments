
int c;
int h=19;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(120, 120);
  background(0);
  smooth(8);
  textFont(f, 17);
}

int [] m =
{
1,14,15,4,
8,11,10,5,
12,7,6,9,
13,2,3,16,
};



void draw() {
  for (int j= 0; j < 120; j=j+30) {
    for (int i= 0; i < 120; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+5, i+22);
      z=z+1;
    }
  }z=0;
}


