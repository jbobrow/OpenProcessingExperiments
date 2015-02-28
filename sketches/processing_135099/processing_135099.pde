
void setup() {
  size(600, 600);
  background(255);
}
void mousePressed() {
  background(random(255),random(255),random(255));
}

void draw() {
  noStroke();
  fill(255,10);
  rect(0,0,width,height);
  noFill();
  stroke(50);
  strokeWeight(random(2,8));
  line(0, random(height), width, random(height));
  stroke(255);
  strokeWeight(150);
  filter(BLUR);
  ellipse(width/2, height/2, width*1.15, width*1.15);
}
