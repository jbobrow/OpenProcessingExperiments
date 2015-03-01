
PImage img;
int num = 30;
float y, sz;

void setup() {
  img = loadImage("photo.jpg");
  size(450, 450);
  image(img, 0, 0);
  frameRate(15);
  sz=width/float(num);
  img.loadPixels();
}

void draw() {
  for (int i=0; i<num+1; i++) {
    float x = sz*i;
    color f = img.get(int(x), int(y));
    fill(f, 150);
    noStroke();
    rect(x, random(height), sz, sz*2);
    if (y>height) y=0;
  }
  y++;
}



