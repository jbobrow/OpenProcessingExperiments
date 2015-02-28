
void setup(){
  size(255,255);
  background(255,255,255);
  noLoop();
}

void draw(){
  strokeWeight(4);
for (int i = 0; i < 255; i += 1){
  stroke(100,80*i,255);
  point(10+i*15,i*i);}
}
