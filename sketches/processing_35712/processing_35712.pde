
void setup(){
  size(300, 300);
  background(200,250,100);
}
void draw(){
  background(200,250,100);
  noStroke();
  fill(mouseX,mouseY,200);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  fill(mouseY,mouseX,200);
  triangle(mouseY-20,mouseX-20,mouseY,mouseX,mouseY+20,mouseY+20);
  stroke(1);
  noFill();
  rectMode(CENTER);
  rect(width/2,height/2,mouseX,mouseX);
}

