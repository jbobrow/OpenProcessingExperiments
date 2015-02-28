
void setup(){
  size(800,150);
  background(20,20,160);
  frameRate(20);
}
float x;
float y;

void draw(){
  stroke(random(255),30,160);
  strokeWeight(random(10));
  fill(30,random(255),160);
  noteline();
}

void noteline(){
  x=random(800);
  y=random(100);
  line(x,150,x,150-y);
  text("♪",x,148-y);
}
