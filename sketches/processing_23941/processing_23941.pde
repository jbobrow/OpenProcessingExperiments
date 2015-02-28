
void setup(){
size(200,200);
frameRate(30);
}

void draw(){
 background(255);
 
  //set rect and ellipses mode
  rectMode(CENTER);
  ellipseMode(CENTER);
 
  
  //draw rect
  stroke(mouseX,30,mouseY);
  fill(50,100,100);
  rect(mouseX,mouseY,30,30);
  
  //draw triangle
  noStroke();
  fill(mouseX,30,mouseY);
  triangle(110,10,150,100,60,150);
  
  //draw ellipse
  stroke(255,0,0);
  noFill();
  ellipse(120,40,30,30);
}
   

