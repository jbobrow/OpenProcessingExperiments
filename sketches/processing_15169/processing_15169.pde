

void setup() {  
  size(500, 500);  
  background(0);  
  smooth(); 
}  
void draw() {  
  noStroke();  
  fill(mouseX, mouseY,0);  
  rect(mouseX, mouseY, 1, 1);  
  rect(600, 280, 50, 200);  
  rect(30, 350, 45, 200);  
  rect(100, 400, 50, 100);  
  rect(200, 400, 40, 100);  
  rect(250, 350, 40, 150);  
  rect(250, 350, 60, 150);  
  rect(350, 350, 60, 150);  
  rect(410, 200, 80, 300);  
  smooth();  
}  


