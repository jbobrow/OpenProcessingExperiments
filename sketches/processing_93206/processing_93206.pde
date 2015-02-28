
void setup(){
  size(255,255);
  noLoop();
}

void draw(){
  strokeWeight(2);
for (int i = 0; i < 255; i += 20){
  stroke(3*i,100,200);
  line(0,0,255,i);}
}
