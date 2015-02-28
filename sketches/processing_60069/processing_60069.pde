
void setup (){

  size(400,400);
  background(66,214,223);
  rectMode(CENTER);
  noStroke();
  smooth();
  frameRate(10);
}

void draw (){

  if(mousePressed)
  {
  fill(223,114,66,80); 
  ellipse(mouseX,mouseY,20,20);
  
  }else{
  
  fill(225,50); 
  ellipse(mouseX,mouseY,mouseX,mouseY);
  }
    
}
