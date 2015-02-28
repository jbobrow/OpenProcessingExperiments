
void setup (){
  size(300,300);
}
void draw(){
  background(255,135,95);
  
  ellipse(mouseX,mouseY,30,20);
  fill(255,150,0);
  
  if(mouseX<width/2) //fish tail switches sides
  triangle(mouseX+15,mouseY,mouseX+25,mouseY+10,mouseX+25,mouseY-10);
  else
  triangle(mouseX-15,mouseY,mouseX-25,mouseY+10,mouseX-25,mouseY-10);
  
  if(mousePressed) //if mouse is pressed color changes
  background(0,135,255);
  
  ellipse(mouseX,mouseY,30,20);
  fill(255,150,0);
  
  if(mouseX<width/2)//fish tail switches sides
  triangle(mouseX+15,mouseY,mouseX+25,mouseY+10,mouseX+25,mouseY-10);
  else
  triangle(mouseX-15,mouseY,mouseX-25,mouseY+10,mouseX-25,mouseY-10);
}


