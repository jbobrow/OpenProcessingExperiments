
int c;
int h=81;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(270, 270);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,10,20,30,40,50,60,70,80,
11,21,31,41,51,61,71,72,1,
22,32,42,52,62,63,73,2,12,
33,43,53,54,64,74,3,13,23,
44,45,55,65,75,4,14,24,34,
46,56,66,76,5,15,25,35,36,
57,67,77,6,16,26,27,37,47,
68,78,7,17,18,28,38,48,58,
79,8,9,19,29,39,49,59,69,
};
void draw() {
  for (int j= 0; j < 270; j=j+30) {
    for (int i= 0; i < 270; i=i+30) {
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






