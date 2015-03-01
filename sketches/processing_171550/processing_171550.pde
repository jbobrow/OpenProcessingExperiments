
void setup() {
  size(400,300);
  background(40,37,89);
  noStroke();
  frameRate(2);
}

void draw() {
  fill(40,37,89);
  rect(0, 0, width, height);
 int rise = second();
background(40+rise*4, 37+rise*4, 89+rise*4);
{
  fill(0,0,0,10);
  rect(0,0,width,height);

for(int x=0;x<100;x++){
  fill(255,255,255);
  ellipse(random(0,width),random(0,height),10,10);
  }
}
}


