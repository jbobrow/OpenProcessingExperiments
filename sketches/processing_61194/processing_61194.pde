
void setup (){
 
  size(400,400);
  background(#FA58D0);
  rectMode(CENTER);
  noStroke();
  smooth();
  frameRate(6);
}
 
void draw (){
 
  if(mousePressed)
  {
  fill(#B40486,90);
  ellipse(mouseX,mouseY,90,90);
   
  }else{
   
  fill(80,10);
  ellipse(mouseX,mouseY,mouseX,mouseY);
  }
     
}
