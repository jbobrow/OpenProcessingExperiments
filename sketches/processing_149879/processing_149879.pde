
void setup() {
  size(400,300);
  
  noStroke();
}

void draw() {
  fill(200,0,200);
  ellipse(mouseX,mouseY,17,10);
  
   fill(0,200,50);
  ellipse(width-mouseX,mouseY,17,10);
  
  fill(0,15); 
  rect(0,0,width,height);
}
