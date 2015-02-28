
void setup(){
  size(255,255);
  background(0);
}
void draw(){
  int count=0;
  float w=random(10,20);
  float l=random(10,20);
  float x=random(0,255);
  float y=random(0,255);
  while (count<=100){
    ellipse(x,y,w,l);
    fill(x,y,100);
    count=count+1;
    if (count==100){
    background(0);
  }
}
}


