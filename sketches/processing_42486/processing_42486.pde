
void setup(){
  size(300, 300);
  smooth();
  noStroke();
  background(150);
  noCursor();
}
 
void draw(){
  fill(mouseX, mouseY, 100);
  noStroke();
  rect(0, 0, width, height);
   
  noStroke();
  fill(255, 0, 0);
 
  if(mouseX>=0 && mouseY>=0){
    fill(mouseX, 100, 40);
  ellipse(270, 30, 60, 60);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
   
      fill(mouseY, 255, mouseY);
  ellipse(270, 270, 60, 60);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
  }
   
  if(mouseX>=0 && mouseX<width){
    fill(100, mouseX, mouseX);
  ellipse(30, 30, 60, 60);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
  }
   
  if(mouseY>=0 && mouseY<height){
    fill(mouseY, 100, mouseY);
  ellipse(30, 270, 60, 60);
  fill(0);
  ellipse(mouseX, mouseY, 10, 10);
   
  }
 
   
}

