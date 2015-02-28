
int time = 0;

void setup(){
  size(600, 600);
  noFill();
  stroke(255);
  colorMode(HSB, 360); 
}

void draw(){
  background(0);
  for(int i = 0; i < 360; i+= 10){
    float x = cos(radians(i)) * 200 + width / 2;    //  大きくしてみる。
    float y = sin(radians(i)) * 200 + height / 2;   //  大きくしてみる。
    float w = cos(radians(time + i)) * 200;
    w = abs(w);
    stroke(i, 360, 360);
    ellipse(x, y, w, w);
  }
  time++;
}
