
//Gabriela Nisenbaum
//Feb 17, 2013
//Divided Screen

void setup(){
  size(600, 600);
  background(255);
}

void draw(){
  //squares
  stroke(255);
  strokeWeight(7);
  
  //top left
  fill(146, 245, 237);
  rect(0, 0, 300, 300);
  noFill();
  strokeWeight(1);
  if((mouseX>0)&&(mouseX<300))
  if((mouseY>0)&&(mouseY<300)){
  ellipse(150, 150, mouseX, mouseY);
  ellipse(50, 50, mouseX, mouseY);
  ellipse(250, 250, mouseX, mouseY);
  ellipse(50, 250, mouseX, mouseY);
  ellipse(250, 50, mouseX, mouseY);
  }
  
  //top right 
  strokeWeight(7);
  fill(195, 146, 245);
  rect(300, 0, 300, 300);
  if((mouseX>300)&&(mouseX<600))
  if((mouseY>0)&&(mouseY<300)){
    fill(247, 152, 192);
    rect(300, 0, 300, 300);
  }
 
  
  //bottom left
  fill(146, 245, 158);
  rect(0, 300, 300, 300);
  if(mousePressed==true){
    fill(223, 247, 252);
    rect(0, 300, 300, 300);
  }
  
  
  //bottom right
  fill(247, 152, 156);
  rect(300, 300, 300, 300);
  if((mouseX>300)&&(mouseX<600))
  if((mouseY>300)&&(mouseY<600)){
  rect(mouseX+10, mouseY+10, 50, 50);
  }
}
