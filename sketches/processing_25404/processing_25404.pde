
void setup(){
  size(300,300);
  background(255);
}

void draw(){
  //赤い円
  noStroke();
  fill(255,0,0);
  ellipse(100,100,50,50);
  
  /*
  上のように書くと、同じ数字を何回も書くことになるので、
  「変数」としてまとめて書いてしまう。
  下は青い円。
  */
  int a = 200;
  int b = 100;
  noFill();
  stroke(0,0,255);
  ellipse(a,a,b,b);
}


