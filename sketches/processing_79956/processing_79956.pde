
void setup(){
  size(400,400);
  smooth();
  frameRate(1000);
}
void draw(){
  float a=random(400);
  float c=random(123);
  float b=a+c;
  stroke(random(89),random(50),random(100));
  background(random(1),random(104),random(256));
  fill(random(89),random(50),random(100));
  rect(b,c,a,b);
}


