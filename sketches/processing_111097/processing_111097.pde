
void setup(){
  size(500,500);
  rectMode(CENTER);
}

void draw (){
  background(0,139,191);
  fill(0,139,191);
  strokeWeight(8);
  stroke (255,mouseX,mouseY);
  ellipse(width/2,height/2,mouseX,mouseY);
  fill(0,139,191,10);
  strokeWeight(2);
  stroke (255,mouseX,mouseY);
  ellipse(width/2,height/2,100,mouseY);
  strokeWeight(2);
  stroke (255,mouseX,mouseY);
  ellipse(width/2,height/2,mouseX,100);
  
  
  println(mouseX + " " + mouseY);  
}


