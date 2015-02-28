
int c;
int h=25;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(150, 150);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,6,12,18,24,
8,14,15,21,2,
11,17,23,4,5,
19,20,1,7,13,
22,3,9,10,16,
};
void draw() {
  for (int j= 0; j < 150; j=j+30) {
    for (int i= 0; i < 150; i=i+30) {
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




