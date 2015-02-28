
 float speed = .01; 
int diameter = 20; 
float x; 
float y;
void setup() { 
  size(500, 500); 
  background(0);
  smooth(); 
  x = width/2;
  y = height/2;
}
void draw() { 
  fill(random(255),random(255),random(255), random(255)); 
  noStroke();
  ellipse(mouseX, mouseY, 90, 90);
} 
                
