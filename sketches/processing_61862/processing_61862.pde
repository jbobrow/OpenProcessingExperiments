
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
    r /= 5;
    g /= 5;
    b /= 5;
    color col = color(255, 140, 0);
    pixels[i] = col;
  }
  updatePixels();
  translate(width/2, height/2);
  rotateY(map(mouseX, 0, width, -PI, PI));
  rotateX(map(mouseY, 0, height, -PI, PI));
  for(int i = 0; i < 12000; i++) {
    stroke(random(255), random(255), random(255));
    rotateX(vone);
    rotateZ(0);
    rotateY(vome-float(i)*1.305);
    point(70, 70, 0);
  }
  vone -= 0.01;
  vome += 0.02;
}


