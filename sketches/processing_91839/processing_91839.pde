
void setup(){
  size(400,400);
}


void draw(){
for (int i=0; i<100; i++){
  float y= random(0, 400);
  float x= random(0, 400);
  float colour= random(0,255);
  fill(colour);
  point(x,y);
}
}


