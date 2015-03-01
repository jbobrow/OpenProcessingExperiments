
float a = 30;
 
void setup() {
  size(1000, 1000);
  noStroke();
  }
 
void draw() {
  fill(255,206,0);
  background(0,154,188);
  translate(width/2-50, height/2);
  for (int i = 0; i < 360; i+=a) {
    for(int q = -36; q < 36; q++){
      float x = i/(a/6)+tan(radians(dist(i/(a/2), i/(a/2), 0, 0)+q+frameCount))*a;
      ellipse(x, q*10, 5, 5);
    }
  }
}
