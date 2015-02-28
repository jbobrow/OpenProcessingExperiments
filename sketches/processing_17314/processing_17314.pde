
void setup() {
  size(700,700); 
  stroke(255);
  background(53,165,145);
}

void draw() {
  //background(53,165,145);
  strokeWeight(mouseX/25);
  stroke(mouseX/3,mouseY/3,mouseX/3,mouseY/3);
  fill(random(200,255),mouseY/3,mouseX/3,mouseX/3);
  triangle(mouseX, mouseY, width-mouseX, (mouseX+1)/(mouseY+1),height-mouseY,mouseY/2);
}

