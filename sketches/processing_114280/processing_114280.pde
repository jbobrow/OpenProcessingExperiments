
int c;
int h=16;
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
0,5,10,15,
7,2,13,8,
9,12,3,6,
14,11,4,1,
};
void draw() {
  for (int j= 0; j < 120; j=j+30) {
    for (int i= 0; i < 120; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+4, i+22);
      z=z+1;
    }
  }z=0;
}



