
void setup() {
  size(800, 600);
  smooth();
  noStroke();
  background(255);
}
 
void draw() {
  float d = dist( mouseX, mouseY, pmouseX, pmouseY );
  float r1 = random(d * -1, 0);
  float r2 = random(d * -2, d * 1);
  //  int n = floor(random(10, 50));
  fill(random(255), 3, 3);
  ellipse(mouseX, mouseY, r1, r2);
}
 
void keyReleased()
{
  if (key=='c' || key=='C') {
    background(255);
  
  }
}
