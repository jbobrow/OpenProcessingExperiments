
 void setup(){
  size(800,400);
  background(0);
  frameRate(20);
  noStroke();
}

void draw(){
  float a = random(-20,20);
  float i = random(1,30);
  ellipse(mouseX+a,mouseY+a,i,i);
  fill(random(150),random(20),35,random(200));
}
