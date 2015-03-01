
PImage img;
int h=0, s=0;

void setup() {
  size(600, 600);
  //background(255);
  img=loadImage("c.png");
  frameRate(10);
}

void draw() {
  background(255);
  colorMode(HSB, 360, 100, 100);
  if (h<360) {
    tint(h, s, 100);
    image(img, 0, 0, width, height);
    h+=10;
  }
  if (s<100) {
    //float hue=map(h,0,width,250,360);
    tint(h, s, 100);
    image(img, 0, 0, width, height);
    s+=10;
  }
  if (h==360) {
    h=0;
  }
  if (s==100) {
    s=0;
  }
}


