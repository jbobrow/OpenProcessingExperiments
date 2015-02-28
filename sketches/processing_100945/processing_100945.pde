
//Day 9 Q5
color  fColor;//四角形の塗りつぶし色を保存している変数
void  setup(){
  size(400,400);
  rectMode(CENTER);
  colorMode(HSB,359,99,99);
  fColor  =  color(0,0,80);
}

void  draw(){
  background(0,0,99);
  stroke(0);
  fill(fColor);
  rect(width/2,height/2,width/2,height/2);
}

void mousePressed(){
    fColor = color(random(359),99,99);
}

void mouseReleased(){
    fColor =  color(0,0,80);
}
