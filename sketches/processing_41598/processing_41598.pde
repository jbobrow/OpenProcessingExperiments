
void setup(){
  size(255, 255);
  smooth();
  noStroke();
  background(240);
  noCursor();
}

void draw(){
  fill(mouseX, mouseY, mouseY);
  noStroke();
  rect(0, 0, width, height);
  
  noStroke();
  fill(255, 0, 0);

  if(mouseX>=0 && mouseY>=0){
    fill(mouseY, mouseY, 255);
  ellipse(mouseX, mouseY, mouseY, mouseX);
  
      fill(mouseY, 255, mouseY, 50);
  ellipse(mouseX, mouseY, mouseY*1.5, mouseX*1.5);
  }
  
  if(mouseX>=0 && mouseX<width){
    fill(255, mouseX, mouseX);
  ellipse(mouseX, mouseY, mouseX/2, mouseX/2);
  }
  
  if(mouseY>=0 && mouseY<height){
    fill(mouseY, 255, mouseY);
  ellipse(mouseX, mouseY, mouseX/4, mouseX/4);
  
  }

  
}

