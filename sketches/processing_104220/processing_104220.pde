
void setup() {
size (400, 400);
background (255);
}

void draw(){
background (255);

  fill(247, 187, 250);
  ellipse(mouseX, mouseY, 75, 75);
  
  fill(13, 250, 244);
  ellipse(mouseX+75, mouseY, 75, 75);
  
  fill(189, 83, 242);
  ellipse(mouseX-75, mouseY, 75, 75);
  
  fill(252, 252, 0);
  ellipse(mouseX+38, mouseY-66, 75, 75);
  
  fill(0, 252, 10);
  ellipse(mouseX-38, mouseY-66, 75, 75);
  
  fill(255, 11, 3);
  ellipse(mouseX, mouseY-132, 75, 75);
  

}
