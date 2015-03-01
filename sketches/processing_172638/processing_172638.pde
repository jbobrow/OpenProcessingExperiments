
float a = 30;

void setup() {
  size(640, 640);
  noStroke();
  fill(0, 255, 150);
}

void draw() {
  background(40);
  translate(width/2-25, height/2);
  for (int i = 0; i < 360; i+=a) {
    for(int q = -36; q < 36; q++){
      float x = i/(a/6)+tan(radians(dist(i/(a/2), i/(a/2), 0, 0)+q*50+frameCount))*a;
      ellipse(x, q*10, 5, 5); 
    }
  }
}



