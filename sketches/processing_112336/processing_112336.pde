
void setup(){
  size(400,400);
background(242,15,178);
  rectMode(CENTER);
}


void draw(){
  //background(242,115,178);
  //noStroke();
  strokeWeight(10);
  stroke(mouseY,mouseX,121);
  fill(mouseX,mouseY,89);
  rect(width/2,width/2,100,100);
  rect(width/8,height/8,50,50);
  rect(7*width/8,7*height/8,50,50);
  
  println(mouseX+""+mouseY);
  
}
