
int c;
int h=49;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(210, 210);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,15,30,45,11,26,41,
48,7,22,37,3,18,33,
40,6,14,29,44,10,25,
32,47,13,21,36,2,17,
24,39,5,20,28,43,9,
16,31,46,12,27,35,1,
8,23,38,4,19,34,42,
};
void draw() {
  for (int j= 0; j < 210; j=j+30) {
    for (int i= 0; i < 210; i=i+30) {
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





