
float angulo = 0;

void setup(){
  size(1920, 1024); 
  background(0); 
} 

void draw(){
  rectMode(CENTER); 
  
  for(int i = 0; i < 10; i++){
  pushMatrix();
  strokeWeight(1);
  noFill();
  stroke(random(255), random(209), random(245));
  translate(i * 100, height/2); 
  rotate(radians(angulo)); 
  rect(mouseX,mouseY, mouseY, mouseX); 
  popMatrix();
  
 
  
  }
  
  angulo +=1;
  
}
