
void setup() {
  size(600, 600);
  colorMode (RGB);
} 
void draw() {
  background (103, 238, 255);
  for (float a= 0; a < width; a=a+10) {
    for (float b =0; b<height; b=b+10) {
      fill(random (255), random (a/3) , random (b));
      ellipse(a, b, 20, 20);
    }
  }
}

