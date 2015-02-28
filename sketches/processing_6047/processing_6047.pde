
void setup() {
  size(500, 500);
  stroke(255);
  background(0, 160, 140);
} 

void draw() {
  ellipse(mouseX, mouseY, random(50,90), random(50,90));
  fill(0,random(150),random(200), random (255));
  
  ellipse(mouseX, mouseY, random(20,50), random(20,50));
  fill(0,random(150),random(200), random(255));
  
  ellipse(mouseX, mouseY, random(10,20), random(10,20));
  fill(0,random(150),random(200), random(255));
  
  line(250, 250, mouseX, mouseY);
  stroke(0);
}



