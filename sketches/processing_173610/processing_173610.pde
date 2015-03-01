
float a = 30;
 
void setup() {
  size(640, 640);
  noStroke();
  }
 
void draw() {
  fill(25,125,0);
  background(1,2,3);
  translate(width/2-50, height/2);
  for (int i = 0; i < 360; i+=a) {
    for(int q = -36; q < 36; q++){
      float x = i/(a/6)+tan(radians(dist(i/(a/2), i/(a/2), 0, 0)+q+frameCount))*a;
      ellipse(x, q*10, 5, 5);
    }
  }
}
