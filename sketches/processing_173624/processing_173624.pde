
float a = 50;
 
void setup() {
  size(1080,720;
  noStroke();
  }
 
void draw() {
  fill(255,0,0);
  background(0,0,0);
  translate(width/2-50, height/2);
  for (int i = 0; i < 360; i+=a) {
    for(int q = -78; q < 47; q++){
      float x = i/(a/1)+tan(radians(dist(i/(a/15), i/(a/8), 0, 0)+q+frameCount))*a;
      ellipse(x, q*18, 11, 11);
    }
  }
}
