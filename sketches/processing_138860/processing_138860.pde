
PImage x;
int y=0;
int z=10;
void setup () {
  colorMode(HSB);
  x= loadImage("2.png");
size(600,250);
}
void draw () {
y=y+z;
  if (y>250||y==0) {
    z=z*-1;
  }
  tint(y, 255, 255);
  image(x, 0, 0, 300, 255);
  tint(mouseX, 255, 255);
  image(x, width/2, 0, 300, 255);
}


