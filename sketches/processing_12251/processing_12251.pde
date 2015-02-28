
void setup(){
 size (500, 500); 
 smooth();

}

void draw(){
  noStroke();
  fill(mouseX, mouseY, 0, 255);
  ellipse(mouseX, mouseY, mouseX, mouseX);
  
}

