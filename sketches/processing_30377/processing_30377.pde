
void setup(){
  size(500, 500);
  smooth();
}

void draw(){
  fill(255, 90);
  noStroke();
  rect(0, 0, 500, 500);
  
  fill(0);
  rect(mouseX, 400, 100, 100);
  
  fill(100, 50);
  noStroke();
  ellipse(mouseX, mouseY, 100, 100);
}
                
                
