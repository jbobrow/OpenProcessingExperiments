
void setup() {
  size(400,400);
  colorMode(HSB,100);
  stroke(0,0,100,1);
  background(0);
  
}

void trace(int n) {
  for(int i = 0 ; i < n ; i++) {
    int fx = i*5;
    line(0, 0, fx, 0);
    translate(fx,0);
    rotate(noise(n)*TWO_PI);
  }
}

void draw() {
  translate(width/2,height/2);
  trace(500);
}

void mouseClicked() {
  background(0);
  noiseSeed((int) random(2<<030) * second());
}
