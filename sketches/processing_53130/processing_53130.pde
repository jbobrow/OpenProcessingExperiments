
void setup() {
  size(600,600);
  noStroke();
}

void draw() {
  //fill(((mouseX+mouseY)/1200)*255);
  
  if(mousePressed){
   fill(mouseX * 0.425, mouseY*0.425, 0);
  ellipse(mouseX, mouseY, 10, 10);
  fill((600-mouseX) * 0.425, (600-mouseY)*0.425, 0);
  ellipse(600-mouseX,600-mouseY,10,10);
  }
  
}

