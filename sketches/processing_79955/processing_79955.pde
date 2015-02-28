
void setup(){
  size(300,300);
  frameRate(100);
}
void draw(){
  float a=random(300);
  float b=300-a;
  background(random(200),random(200),random(0));
  fill(random(0),random(200),random(100));
  ellipse(a,b,a,b);
}


