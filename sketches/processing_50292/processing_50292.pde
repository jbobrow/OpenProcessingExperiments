
void setup() {
  size(800,800);
  smooth();
  noStroke();
  background(1);
}

void draw() {
  //background(255);
  int i = int(random(100));
  
  if(i % 2 == 0) {
    fill(255,1);
    ellipse(mouseX,mouseY,random(800),random(800));
  }
  else {
    fill(0,1);
    ellipse(mouseX,mouseY,random(800),random(800));
  }
  fill(1,30);
  ellipse(random(width),random(height),20,20);
}

