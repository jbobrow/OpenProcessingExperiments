
void setup(){
  size(500,500);
  smooth();
  background(0);
}
  
void draw(){
   
noFill();
strokeWeight(2);
 float n= dist(mouseX, mouseY, pmouseX, pmouseY)*2;
 
bezier(mouseX,mouseY,-mouseY,-mouseX,0,0,mouseX,mouseY);
ellipse(mouseX,mouseY,n,n); 

  if (mousePressed == true) 
  {
    stroke(0,0,0,50);
  } 
  
  else 
  {
   stroke(198,113,113,20);
  }
}

