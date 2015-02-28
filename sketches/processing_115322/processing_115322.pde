
int c;
int h=75;
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
1,13,53,8,62,61,60,2,
14,15,23,48,47,46,16,51,
54,24,25,38,39,28,41,11,
55,43,32,35,34,29,22,10,
9,44,36,31,30,33,21,56,
58,20,37,26,27,40,45,7,
6,49,42,17,18,19,50,59,
63,52,12,57,3,4,5,64,
};



void draw() {
  for (int j= 0; j < 240; j=j+30) {
    for (int i= 0; i < 240; i=i+30) {
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


