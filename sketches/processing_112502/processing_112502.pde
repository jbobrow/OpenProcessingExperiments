
void setup(){
  size(450,500);
  background(255,255,255);  
}

void draw(){
  background(255,255,255);
    fill(#FA00EA,100);
  noStroke();
  ellipse(mouseX+200,mouseY,mouseX+500,mouseX+500);
  fill(#5A03FF,100);
  noStroke();
  ellipse(mouseX-400,mouseY,mouseX+200,mouseX+200);
  fill(255,255,255,100);
  noStroke();
  ellipse(mouseX,mouseY+300,mouseX+300,mouseX+300);
  fill(#FA00EA,100);
  noStroke();
  ellipse(mouseX+300,mouseY,mouseX+400,mouseX+400);
  fill(#5A03FF,100);
  noStroke();
  ellipse(mouseX-200,mouseY,mouseX+200,mouseX+200);
  fill(255,255,255,100);
  noStroke();
  ellipse(mouseX,mouseY-200,mouseX+200,mouseX+200);
  fill(#5A03FF,100);
  noStroke();
  ellipse(mouseX,mouseY,400,400);
  fill(0,139,191,200);
  noStroke();
  ellipse(mouseX,mouseY,200,200);
  
  println(mouseX + " " + mouseY);
 
  
  
 
}



