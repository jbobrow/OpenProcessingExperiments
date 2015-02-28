
void setup(){
  size(400,400);
  background (205, 5, 237, 50);
  rectMode(CENTER);
  noStroke();
  smooth();
  frameRate(10);
}
 
void draw (){
  frameRate(10);
  
  
  if(mousePressed)
  {
  fill(65,162,13,80);
  ellipse(mouseX,mouseY,mouseX,mouseX);

   
  }else{
   
  fill(225,50);
  ellipse(mouseX,mouseY,mouseX,mouseX);
  
  }
     
}
