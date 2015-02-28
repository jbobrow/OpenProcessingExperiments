
void setup(){
  size(500,500);
  rectMode(CENTER); 
  
}

void draw(){
  background(0,139,191);
  stroke(255,mouseY,mouseX);
  strokeWeight(50);
  point(mouseX-195,250);
  strokeWeight(5);
  fill(0,139,191);
  ellipse(mouseX-10,mouseY,200,200);
  strokeWeight(8);
  point(mouseX-10,mouseY);
  

  println(mouseX + " " + mouseY); 
}


