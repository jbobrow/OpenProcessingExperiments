
int time = 0;

void setup(){
  size(600, 600);
  noFill();
  stroke(255);
  colorMode(HSB, 360);
  textSize(32);
}

void draw(){
  background(0);
  text(frameCount * 0.01, 10, 30);
  for(int i = 0; i < 360; i+= 5){
    float x = cos(radians(i)) * 200 + width / 2;
    float y = sin(radians(i)) * 200 + height / 2;
    float w = cos(radians(time + i * frameCount * 0.01)) * 100; // frameCountを使うことで、徐々に変化していく
    w = abs(w);
    stroke(i, 360, 360);
    ellipse(x, y, w, w);
  }
  time += 2;
}
