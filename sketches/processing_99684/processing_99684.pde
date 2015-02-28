

void setup(){
  size(1000,400);
  background(255);
}
void draw(){
   background(120);
  strokeWeight(1);
  stroke(0);
  
  point(10,10);
  strokeWeight(0);
  stroke(255,0,0);
  line(15,1,100,30);
  
  noStroke();
  fill(20,10,0,70);
  rect(mouseX,mouseY,200,50);
  noStroke();
  fill(0,100,200,80);
  triangle(mouseY,20,mouseX,300,-mouseX,-mouseY);
   fill(100,100,200,80);
  ellipse(mouseY+100,100,mouseX,200);
  
  
}


