
int time = 0;
float Power = 1;
void setup(){
  size(600, 600);
  noFill();
  stroke(255);
  colorMode(HSB, 360); 
}

void draw(){
  background(0);
  for(int i = 0; i < 360; i+= 15){
    float x = cos(radians(i)*Power) * 100 + width / 2;
    float y = sin(radians(i)*Power) * 100 + height / 2;
    float w = cos(radians(time + i)) * 200;
    w = abs(w);
    stroke(i, 360, 360);   //  色をつけた 
    fill(i,360,360,80);    //  色を塗りつぶし
    ellipse(x, y, w, w);
  }
  time++;
  
  //マウスを押し続けるとパワーがたまる
  if(mousePressed) {
    Power = Power * 1.01;
  } else {
    if(Power > 1) {
      Power = Power * 0.999;
    } else {
      Power = 1;
    }
  }
}

