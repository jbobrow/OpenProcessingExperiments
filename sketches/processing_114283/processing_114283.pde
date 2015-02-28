
int c;
int h=64;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(240, 240);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,9,18,27,36,45,54,63,
55,43,62,33,29,12,2,16,
57,24,52,15,42,38,21,3,
10,4,32,61,17,51,47,30,
19,39,5,40,14,26,60,49,
28,58,41,6,48,23,35,13,
37,22,11,50,7,56,25,44,
46,53,31,20,59,1,8,34,
};
void draw() {
  for (int j= 0; j < 240; j=j+30) {
    for (int i= 0; i < 240; i=i+30) {
      c= m[z];
      colorMode(HSB, h, h, h);
      fill(c, h, h);
      rect(j, i, 30, 30);
      fill(0);
      text(c, j+7, i+22);
      z=z+1;
    }
  }z=0;
}




