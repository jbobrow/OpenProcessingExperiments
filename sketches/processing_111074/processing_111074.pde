

void setup(){
  size(400,400);
  background(74,38,67);
  
}

void draw(){
  background(74,38,67);
  stroke(218,195,199);
  strokeWeight(2);
  ellipse(width/2,height/2,mouseY,mouseY);
  fill(163,104,115,mouseX);
  ellipse(width/2,height/2,mouseX,mouseX);
  fill(218,195,199,mouseY);
  ellipse(width/4,height/4,mouseY-100,mouseY-100);
  fill(74,38,67,mouseY);
  ellipse(3*width/4,3*height/4,mouseX-100,mouseX-100);
  ellipse(mouseY,mouseX,mouseY-100,mouseY-100);
  fill(163,104,115,mouseY);
  ellipse(mouseY,mouseX,mouseX-100,mouseX-100);
  
  
}


