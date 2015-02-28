
int mysize;

void setup(){
  size(500,500);
  background(255);
}
void draw(){
  mysize = int(random(10,150));
  noStroke();
  saturation(126);
  fill(random(0,255), random(0,255), random(0,255));
  rect(random(5,400),random(5,400),mysize,mysize);
}

