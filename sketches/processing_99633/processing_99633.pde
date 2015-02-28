
void setup(){
  size(1000,400);
  background(255);
}
void draw(){
   background(0,200,125,50);
  strokeWeight(10);
  stroke(0);
  noStroke();
  fill(200,50,100,100);
  ellipse(mouseX,mouseY,50,50);
  noStroke();
  fill(100,100,200,100);
  triangle(mouseY,80,mouseX,300,-mouseX,-mouseY);
  fill(50,0,50,100);
  rect(mouseY+100,200,mouseX,100);
  
  
}


