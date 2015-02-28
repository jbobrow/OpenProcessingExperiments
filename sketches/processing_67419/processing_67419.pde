
void setup(){
  size(400,400);
  strokeWeight(4);
  background(100);
  frameRate(39);
}

void draw(){
  strokeWeight(random(400));
  stroke(random(255),(255),0);
  point(200,200);
  smooth();
  stroke(random(400));
  fill(0,0,255);
  rect(0,0,100,100);
  
}

