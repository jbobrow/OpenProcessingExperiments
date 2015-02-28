

void setup() {
  size(600, 600);
  background(150);
  smooth();
}

void draw() {
  fill(random(100), random(100),random(100)); 
  strokeWeight(random (10));
  line(pmouseX, pmouseY, mouseX, mouseY); 

 
}

void mousePressed() {
ellipse(mouseX, mouseY, random(300), random(300));  
}




