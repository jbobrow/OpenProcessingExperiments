
void setup(){
  frameRate(3);
  size(1200,1200);
  background(0);
}
void draw(){
  
  
int cnt = mouseY;
while (cnt>0) {
  float x=random(0,width);
  float y=random(0,height);
  triangle(x,y,600,600,y,x);
  cnt--;//cnt=cnt-1;
}
}

