
void setup(){
  size(1000,600);
  background(255);
}
void draw(){
   background(255);
  strokeWeight(10);
  stroke(0);
  
  //point(10,10);
  strokeWeight(0);
  stroke(255,0,0);
  //line(15,1,100,30);
  
  noStroke();
  fill(250,90,0,100);
  rect(mouseX,mouseY,200,100);
  noStroke();
  fill(0,100,250,100);
  triangle(mouseY,900,mouseX,400,-mouseX,-mouseY);
   fill(90,90,250,100);
  ellipse(mouseY+200,200,mouseX,400);
  
  
}


