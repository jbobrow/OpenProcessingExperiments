
float z = 0;

void setup () {
  size(500, 500);
  noStroke();
  colorMode(HSB);

}
void draw() {
  float x = 0;
  while (x < width) {
    float y = 0;
    while (y < height) {
      float col = 255 * noise(x/700, y/700, z);
      fill(col, col, 255);
      rect(x, y, 30, 30);
      y = y + 30;
    }
    x = x + 30;
  }
  z = z + 0.005;



  float m = 0;
  while (m < width) {
    float n = 0;
    while (n < height) {
     float col = 255 * noise(m/50, n/50, z/900);
      fill(col, col, 255);
      ellipse(m + 15, n +15, 20, 20);
      n = n + 30;
    }
    m = m + 30;
  }
  z = z + 0.005;
 


float a = 0;
while (a < width) {
  float b = 0;
  while (b < height) {
    float col = 255 * noise(a/500, b/500, z);
    fill(col, col, 255);
    ellipse(a + 15, b +15, 10, 10);
    b = b + 30;
  }
  a = a + 30;
}
z = z + 0.005;


}



