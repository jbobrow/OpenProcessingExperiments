
void setup(){ 
  background(255);
  size(700,500); 
  smooth(); 

} 
void draw(){ 
  //noStroke(); 
  //"mouseX, mouseY, n, n"-------------------LISTO! (L)
  
  fill(mouseX,mouseY,0,20); 
  ellipse(100,100,mouseX,mouseX); 
  
  fill(mouseX,mouseY,0,40);
  ellipse(300,200,mouseX,mouseX); 
  
  fill(mouseX,mouseY,0,60); 
  ellipse(200,350,mouseX,mouseX); 
  
  fill(mouseX,mouseY,0,80); 
  ellipse(400,380,mouseX,mouseX); 
  
  fill(mouseX,mouseY,0,20);
  ellipse(100,700,mouseX,mouseX);
  
  fill(mouseX,mouseY,0,40); 
  ellipse(100,600,mouseX,mouseX); 
  
  fill(mouseX,mouseY,0,60); 
  ellipse(600,100,mouseX,mouseX); 

} 






