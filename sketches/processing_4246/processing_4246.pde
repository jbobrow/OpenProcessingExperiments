
void setup(){  
  background(255);  
  size(400,600);  
  smooth();  
}  
 
void draw(){  
 
  stroke(3);  
  strokeWeight(3);  
  fill(mouseX,0,mouseY,150);  
  float a = random(width);  
  float b = random(height);  
  float c = random (10,20);  
  ellipse (a,b,c,c);  
 
  stroke(0);  
  strokeWeight(2);  
  fill(0,mouseX,mouseY,150);   
  float d = random (width);  
  float e = random (height);  
  float f = random (30,40);  
  rect (d,e,f,f);  
 
  stroke(0);  
  strokeWeight(3);  
  fill(mouseX,mouseY,0,150);  
  float g = random (width);  
  float h = random (height);  
  float i = random (50,60);  
  ellipse(g,h,i,i);  
}  
 
 

  

