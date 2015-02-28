
void setup(){
  size(500,500);
  rectMode(CENTER); 
  
}

void draw(){
  background(0,0,0);
  stroke(255,255,mouseX);
  strokeWeight(8);
  point(mouseX-10,mouseY);
  point(mouseX-50,250);

  println(mouseX + " " + mouseY); 
}


