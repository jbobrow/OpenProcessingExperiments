
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
36,47,28,69,80,61,12,23,4,
29,37,45,62,70,78,5,13,21,
46,27,38,79,60,71,22,3,14,
15,26,7,39,50,31,63,74,55,
8,16,24,32,40,48,56,64,72,
25,6,17,49,30,41,73,54,65,
66,77,58,9,20,1,42,53,34,
59,67,75,2,10,18,35,43,51,
76,57,68,19,0,11,52,33,44,
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





