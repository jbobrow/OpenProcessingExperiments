
int time = 0;

void setup(){
  size(600, 600);
  noFill();
  colorMode(HSB, 360);
  rectMode(CENTER);
  textSize(32);
}

void draw(){
  background(0);
  text(frameCount * 0.01, 10, 30);
  for(int i = 0; i < 360; i+= 5){
    float x = cos(radians(i)) * 200 + width / 2;
    float y = sin(radians(i)) * 200 + height / 2;
    float w = cos(radians(time + i * frameCount * 0.01)) * 100;
    w = abs(w);
    stroke(i, 360, 360);
    rect(x, y, w, w);  //  四角形にした。
  }
  time += 2;
}
