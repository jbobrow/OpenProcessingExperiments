

void setup(){
  println("running setup");
  size(500,500);
}

void draw () {
  background(0);
  float r = random(1,25);
  fill(random(0,255),random(0,255),random(0,255));
  ellipse(random(0,width),random(0,height),r,r);
}


