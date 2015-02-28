
//Catherine Steller processing 2011
//Lesson 1 Project


void setup(){
  size(200,200);
  
  
}



void draw(){
  //updates display
  
  background(255);
  
  ellipseMode(CENTER);
  rectMode(CENTER);
  
  stroke(0);
  fill(mouseX,0,mouseY);
  rect(mouseX,mouseY,20,30);
  
  fill(mouseX,100,mouseY);
  ellipse(mouseX+30,mouseY+30,20,30);
  
  fill(165,70,33);
  rect(mouseX,mouseY+50,20,30);
  
  
}





