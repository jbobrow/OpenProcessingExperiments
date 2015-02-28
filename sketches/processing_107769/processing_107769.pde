
void setup(){
  size(480,120);
  smooth();
  stroke(random(84),random(190,193),random(140,160));
}

void draw(){
  background(255);
  for(int x=-40;x<width;x+=10){
    float mx=mouseX*2;
    float offsetA=random(-mx,mx);
    float offsetB=random(-mx,mx);
    line(x+offsetA,150,x+offsetB+40,-20);
  }
}
