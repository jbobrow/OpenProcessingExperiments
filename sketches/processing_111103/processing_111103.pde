
void setup(){
  size(500,500);
  rectMode(CENTER); 
  
}

void draw(){
  background(0,139,191);
  stroke(255,255,255);
  strokeWeight(400);
  point(mouseX-10,mouseY);
  strokeWeight(5);
  fill(mouseY,0,mouseX);
  ellipse(mouseX-10,mouseY,200,mouseX);
  ellipse(mouseX-10,mouseY,mouseY,200);
  strokeWeight(8);
  point(mouseX-10,mouseY);
  

  println(mouseX + " " + mouseY); 
}


