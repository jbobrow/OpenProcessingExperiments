
void setup(){
  background (0);
  size (250,250);
}
//Got bits of this code from a tut.
void draw(){
int a = int(random(250));
int b = int(random(250));
noStroke();
colorMode(HSB, mouseX);
for (int i = 0; i < 250; i++) {
  for (int j = 0; j < 250; j++) {
    stroke(i, j, b);
    point(i, j);
  }
}
  blend(0,0,a,b, 0, 0, 250,250, DIFFERENCE);
  blend(0,0,b,a, 0, 0, 250,250, DIFFERENCE);
  blend(0,0,a,b, 0, 0, 250,250, LIGHTEST);
  blend(0,0,b,a, 0, 0, 250,250, DIFFERENCE);

}

