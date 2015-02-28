
// Line variations
// Echo Chen (puyce7244@yahoo.com.tw)
 
 
void setup() {
  size(500, 500);
  strokeWeight(0.5);
  background(0);
}
 
void draw() {
  if (mousePressed) {
  fill(mouseY,mouseX,5);
  }
  else {
    fill(0);
  }
  fill(mouseX,mouseY,0,70);
  noStroke();
  triangle(mouseX, mouseY,0,500,0,0);
  
  fill(mouseX,mouseY,0,50);
  noStroke();
  triangle(mouseX, mouseY,500,500,500,0);
  
  fill(mouseX,mouseY,0,30);
  noStroke();
  triangle(mouseX, mouseY,500,0,0,0);
  
  fill(mouseX,mouseY,0,10);
  noStroke();
  triangle(mouseX, mouseY,500,500,0,500);
}


