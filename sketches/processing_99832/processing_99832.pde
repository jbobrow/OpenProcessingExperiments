
void setup(){
  size(500,400);
  background(255);
}
void draw(){
  background(255);
  strokeWeight(20);
  stroke(0);
  strokeWeight(0);
  stroke(255,0,0);
  
  noStroke();
  fill(200,100,0,70);
  rect(mouseX,mouseY,100,50);
  fill(50,60,80,70);
  rect(mouseX,mouseY,50,50);
  noStroke();
  fill(0,100,200,80);
  triangle(mouseY,10,mouseX,10,-mouseX,-mouseY);
   fill(100,100,200,80);
  ellipse(mouseY+50,100,-mouseX,200);
   fill(100,100,300,80);
  ellipse(mouseY+30,50,mouseX,100);
  
  
  
}


