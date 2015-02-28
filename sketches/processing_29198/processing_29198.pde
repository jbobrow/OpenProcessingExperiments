
void setup(){
  size(200,200);
  background(255);
  frameRate(10);
  smooth();
}

void draw(){
  fill(128,random(256),255);
  noStroke();
  float es = random(10,30);
  ellipse(mouseX,mouseY,es,es);
}


