
float theta=.1; 

void setup(){
  size(600, 600); 
  smooth(); 
  background(0); 
  frameRate(30); 
}

void draw(){
  //background(0); 
  stroke(100); 
  fill(205, 205, 205); 
  ellipse(mouseX, mouseY, 10, 10); 
  pushMatrix(); 
  
  translate (mouseX, mouseY); 
  rotate(theta);
  
  for(int i=10; i<20;i=i+5){
    ellipse(0, i, 10, 10); 
  

  }
   
  
  
  popMatrix(); 
  
  translate(mouseX, mouseY); 
  rotate(-theta); 

  
  theta+=.3; 
}

void mousePressed(){
  background(0); 
}
  

