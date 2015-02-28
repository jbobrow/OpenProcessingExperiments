
PImage a;
float z=0;
void setup () {
  size(600, 500);
  colorMode(HSB);
  a= loadImage("12anos3.jpg");
}
void draw () {
  image(a, 0,0,width,height);
  tint(z, 200, 200,200);
  z=z+1;
  if (z>255||z==0) {
    z=z*-1;
  }
}


