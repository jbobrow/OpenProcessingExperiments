
int c;
int h=9;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(90, 90);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,4,8,
5,6,1,
7,2,3,
};
void draw() {
  for (int j= 0; j < 90; j=j+30) {
    for (int i= 0; i < 90; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+10, i+22);
      z=z+1;
    }
  }z=0;
}



