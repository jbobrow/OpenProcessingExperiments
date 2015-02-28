
void setup(){
  size(800,800);
  
}

void draw(){
  background(0,139,191);
  fill(255,255,255,200);
  strokeWeight(4);
  stroke(mouseX,mouseY,mouseX);
  rect(width/4,100,200,200);
  
  line(width/2,300,mouseX+mouseX,mouseY+mouseY);
  
  fill(255,255,255,100);
  //strokeWeight(5);
  //stroke(30,35,250);
  rect(mouseX-200,mouseY-200,mouseX+200,mouseY+200);
  
 
  line(width/4,100,mouseX-200,mouseY-200);
  
  line(width/2,100,mouseX+mouseX,mouseY-200);
  
  line(width/4,300,mouseX-200,mouseY+mouseY);
  

  println(mouseX + " " + mouseY);  
}


