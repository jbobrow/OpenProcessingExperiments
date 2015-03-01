
void setup() {
  size(640, 640);
  strokeWeight(15);
}

void draw() {
  background(255);
  for (int i = 218; i > 0; i-=1) {
    float a = i/2+sin(radians(i+frameCount*3))*(i/4);
    stroke(a*2, a/4, a/2);
    line(width/2-a, 100+(i+a), width/2+a, 100+(i+a));
    line(width/2-a, height-100-i+a, width/2+a, height-100-i+a);
  }
}



