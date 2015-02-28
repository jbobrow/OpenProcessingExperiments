
PImage photo;

void setup() {
  size(800, 567);
  photo=loadImage("test2.jpg");
  background(0);
  smooth();
}
void draw() {
  int t=(int)map(mouseX,0,width,3,20);
  int o=(int)random(1,10);
  for (int i = 0; i < photo.width; i+=t) {
    for (int j = 0; j < photo.height; j+=t ) {
      int all=i+j*photo.width;
      float r=red(photo.pixels[all]);
      float g=green(photo.pixels[all]);
      float b=blue(photo.pixels[all]);
      noStroke();
      fill(r, g, b, 100);
      ellipse(i, j, t-o, t-o);

    }
  }
}



