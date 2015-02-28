
void setup(){
  size(800,800);
  
}

void draw(){
  background(192);
  fill(#FAF31E);
  strokeWeight(2);
  stroke(mouseX,mouseY,250);
  rect(width/4,100,200,200);
  
  line(width/2,300,mouseX+mouseX,mouseY+mouseY);
  
  line(width/4,100,mouseX-200,mouseY-200);
  
  line(width/2,100,mouseX+mouseX,mouseY-200);
  
  line(width/4,300,mouseX-200,mouseY+mouseY);
  
  fill(116,109,33,200);
  //strokeWeight(5);
  //stroke(30,35,250);
  rect(mouseX-200,mouseY-200,mouseX+200,mouseY+200);
  
 

  

  println(mouseX + " " + mouseY);  
}


