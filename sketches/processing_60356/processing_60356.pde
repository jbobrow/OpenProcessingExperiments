
float vone;
float vome;
void setup() {
  background(0);
  size(300, 300, P3D);
  smooth();
}
void draw() {
  loadPixels();
  for(int i = 0; i < width*height; i++) {
    float r = red(pixels[i]);
    float g = green(pixels[i]);
    float b = blue(pixels[i]);
    r /= 1.2;
    g /= 1.2;
    b /= 1.2;
    color col = color(r, g, b);
    pixels[i] = col;
  }
  updatePixels();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  for(int i = 0; i < 12000; i++) {
    stroke(0, 255, 0);
    rotateX(vone);
    rotateZ(0);
    rotateY(vome-float(i)*1.305);
    point(70, 70, 0);
  }
  vone -= 0.01;
  vome += 0.02;
}

