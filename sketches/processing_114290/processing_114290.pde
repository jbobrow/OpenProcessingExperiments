
int c;
int h=121;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(330, 330);
  background(0);
  smooth(8);
  textFont(f, 17);
}
int [] m = 
{
0,23,46,69,92,115,17,40,63,86,109,
120,11,34,57,80,103,5,28,51,74,97,
108,10,22,45,68,91,114,16,39,62,85,
96,119,21,33,56,79,102,4,27,50,73,
84,107,9,32,44,67,90,113,15,38,61,
72,95,118,20,43,55,78,101,3,26,49,
60,83,106,8,31,54,66,89,112,14,37,
48,71,94,117,19,42,65,77,100,2,25,
36,59,82,105,7,30,53,76,88,111,13,
24,47,70,93,116,18,41,64,87,99,1,
12,35,58,81,104,6,29,52,75,98,110,
};
void draw() {
  for (int j= 0; j < 330; j=j+30) {
    for (int i= 0; i < 330; i=i+30) {
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




