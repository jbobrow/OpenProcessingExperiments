
int mouseX;
int mouseY;

float distance;

void setup() {
  
  size (600, 600);
  background (255);
  mouseX = 300;
  mouseY = 300;

}


void draw() {
  
  strokeWeight(20); 
  stroke (255, 51, 204, 20);
  if (mousePressed) {
  distance = dist (pmouseX, pmouseY, mouseX, mouseY);
  line(pmouseX, pmouseY, mouseX, mouseY);
  println (distance); 
  
  fill(51, 255, 255, 10);
  noStroke();
  ellipse(pmouseX, pmouseY, mouseX, mouseY);
  println(distance);

}
}  

