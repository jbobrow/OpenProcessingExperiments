
void setup() {
 size(300, 600);
 background(0);
 smooth();
 
 colorMode(HSB, 300);
}
 
void draw() {
  stroke(mouseX,random(150),mouseY,random(30));
  strokeWeight(random(5));
  fill(mouseX,random(255),mouseY,random(10));
  ellipse(mouseX,random(300),mouseY,random(600));
  
}
 
void mousePressed() {
  background(0);    
}


