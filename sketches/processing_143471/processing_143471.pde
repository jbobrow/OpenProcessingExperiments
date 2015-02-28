

void setup(){
  size(300,300);
}

void draw(){
  background(162,236,240);
  stroke(0,0);
  
  fill(0,mouseX);
  ellipse(mouseX,mouseY-80,100,70);
  ellipse(mouseX,mouseY,150,100);
  
  fill(250,mouseX);
  ellipse(mouseX, mouseY+20,120,100);
  
  fill(250);
  ellipse(mouseX-15,mouseY-90,15,20);
  ellipse(mouseX+15,mouseY-90,15,20);
  
  fill(0);
  ellipse(mouseX-15,mouseY-90,8,8);
  ellipse(mouseX+15,mouseY-90,8,8);
  
  fill(250,150,0);
  ellipse(mouseX,mouseY-70,45,20);
  
  fill(250,150,0,mouseX);
ellipse(mouseX-35,mouseY+40,40,60);
ellipse(mouseX+35,mouseY+40,40,60);
}


