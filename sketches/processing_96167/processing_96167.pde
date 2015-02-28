


int mida=100;
void setup(){
 
  size(800,800);
  strokeWeight(2);
  
}


void draw(){
  
  
  mida = mouseX/4;
  
  background(0);
  
  fill(255,mouseY,0);
  
  stroke(255,mouseX,0);
  
  strokeWeight(mouseX);
  
  
  ellipse(mouseX,mouseY,mida,mida);
  
  ellipse(mouseX,mouseY,mida/2,mida/2);
  
  ellipse(mouseX,mouseY,mida/2,mida/2);
  
  fill(100,mouseY,0);
  
  ellipse(mouseX,mouseY,50,25);
  ellipse(mouseX,mouseY,10,205);
  

}


