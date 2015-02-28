
void setup() {
  size(500,500);
  background(255,0,0);
}
void draw() {
  fill(random(255),random(255),random(255),100);
  
  stroke(random(255),random(255),random(255));
   strokeWeight(1);
  ellipse(random(500),random(500),80,80);
  strokeWeight(10);
  fill(random(255),random(255),random(255));
  rect(random(450),random(450),50,50);
   strokeWeight(6);
  rect(random(400),random(400), 30,50);
}
