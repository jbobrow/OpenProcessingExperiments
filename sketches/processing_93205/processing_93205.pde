
void setup(){
  size(255,255);
  background(255,255,255);
  noLoop();
}

void draw(){
  strokeWeight(4);
for (int i = 15; i < 255; i += 10){
  stroke(3*i,100,200);
  point(i,i);
  point(i,10);}
}
