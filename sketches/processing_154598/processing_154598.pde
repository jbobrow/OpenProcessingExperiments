
void setup(){
  size(500, 1000);
  background(35, 36, 86);
}

void draw(){
  stroke(255, 238, 108);
  fill(255, 238, 108);
  strokeWeight(2);
  line(mouseX, mouseY, mouseX, mouseY);
 
}

void mousePressed(){
   ellipse(mouseX, mouseY, 20, 20);
}




