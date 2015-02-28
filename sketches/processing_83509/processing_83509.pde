
int time = 0;

void setup(){
  size(600, 600);
  noFill();
  stroke(255);
  colorMode(HSB, 360);
}

void draw(){
  background(0);
  for(int i = 0; i < 360; i+= 5){
    float x = cos(radians(i)) * 200 + width / 2;
    float y = sin(radians(i)) * 200 + height / 2;
    float w = cos(radians(time + i * 2)) * 100;     //　増やしたらいい感じになった。（四角形になった）
    w = abs(w);
    stroke(i, 360, 360);
    ellipse(x, y, w, w);
  }
  time++;
}
