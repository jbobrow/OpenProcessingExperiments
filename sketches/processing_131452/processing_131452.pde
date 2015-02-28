
void setup() {
  size(500,500);
  background(0);
}

void draw() {
  ellipseMode(CENTER);
  fill(182,232,68,30);
  strokeWeight(5);
  ellipse(mouseX,mouseY,random(50),random(50));
  translate(width/2,height/2);
  rotate(random(TWO_PI));
 stroke(27,135,191,50);
 strokeWeight(10);
 line(random(500),random(500),random(500),random(500));

}
