
void setup() {
  size(500, 500);
  background(0);
  smooth();
}
 
void draw() {
 
  fill(255, 20);
  noStroke();
  rect(0, 0, width, height);
  stroke(0, 50);
  ellipse(mouseX,mouseY, mouseX/3-20, mouseX/3-20);
  ellipse(mouseX,mouseY, mouseX/5-50, mouseX/5-50);
  ellipse(mouseX,mouseY, mouseX/2, mouseX/2);
  ellipse(mouseX,mouseY, mouseX*2, mouseX*2);
  ellipse(mouseX,mouseY, mouseX*2+20, mouseX*2+20);
  ellipse(mouseX,mouseY, mouseX*3, mouseX*3);
  ellipse(mouseX,mouseY, mouseX, mouseX);
  ellipse(mouseX,mouseY, (mouseX+100)/2, (mouseX+100)/2);
  ellipse(mouseX,mouseY, (mouseX+100)/2*3, (mouseX+100)/2*3);
  ellipse(mouseX,mouseY, (mouseX+400)/2, (mouseX+400)/2);
  
  stroke(0, 50);
  ellipse(mouseX,mouseY, mouseY/3-20, mouseY/3-20);
  ellipse(mouseX,mouseY, mouseY/5-50, mouseY/5-50);
  ellipse(mouseX,mouseY, mouseY/2, mouseY/2);
  ellipse(mouseX,mouseY, mouseY*2, mouseY*2);
  ellipse(mouseX,mouseY, mouseY*2+20, mouseY*2+20);
  ellipse(mouseX,mouseY, mouseY*3, mouseY*3);
  ellipse(mouseX,mouseY, mouseY, mouseY);
  ellipse(mouseX,mouseY, (mouseY+100)/2, (mouseY+100)/2);
  ellipse(mouseX,mouseY, (mouseY+100)/2*3, (mouseY+100)/2*3);
  ellipse(mouseX,mouseY, (mouseY+400)/2, (mouseY+400)/2);
  
  stroke(0, 70);
  ellipse(mouseX,mouseY, mouseX/3-20, mouseX/3-20);
  ellipse(mouseX,mouseY, mouseX/5-50, mouseX/5-50);
  ellipse(mouseX,mouseY, mouseX/2, mouseX/2);
  ellipse(mouseX,mouseY, mouseX*2, mouseX*2);
  ellipse(mouseX,mouseY, mouseX*2+20, mouseX*2+20);
  ellipse(mouseX,mouseY, mouseX*3, mouseX*3);
  ellipse(mouseX,mouseY, mouseX, mouseX);
  ellipse(mouseX,mouseY, 400-mouseX, 400-mouseX);
  ellipse(mouseX,mouseY, 600-mouseX, 600-mouseX);
  ellipse(mouseX,mouseY, (mouseX-100)/2, (mouseX-100)/2);
  ellipse(mouseX,mouseY, (mouseX-100)/2*3, (mouseX-100)/2*3);
  ellipse(mouseX,mouseY, (mouseX-400)/2, (mouseX-400)/2);
 
}


