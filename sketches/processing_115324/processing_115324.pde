
int c;
int h=120;
int z=0;
PFont f;
void setup() {
  f = createFont("Arial", 17, true);
  size(300, 300);
  background(0);
  smooth(8);
  textFont(f, 17);
}

int [] m =
{
1,18,85,89,11,8,98,97,96,2,
17,19,31,71,26,80,79,78,20,84,
86,32,33,41,66,65,64,34,69,15,
14,72,42,43,56,57,46,59,29,87,
88,73,61,50,53,52,47,40,28,13,
91,27,62,54,49,48,51,39,74,10,
9,76,38,55,44,45,58,63,25,92,
94,24,67,60,35,36,37,68,77,7,
6,81,70,30,75,21,22,23,82,95,
99,83,16,12,90,93,3,4,5,100,
};



void draw() {
  for (int j= 0; j < 300; j=j+30) {
    for (int i= 0; i < 300; i=i+30) {
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

