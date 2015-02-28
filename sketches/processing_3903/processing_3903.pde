

  
float x, y; 
float size = 20; 
 
void setup()  
{ 
  size(400,400); 
  noStroke(); 
  frameRate(25);
} 
 
void draw()  
{ 
  background(0); 
   
  x = x + 10; 
   
  if (x > width + size) { 
    x = -size; 
  }  
   
  translate(x, height/95-size/2); 
  fill(255); 
  ellipse(90, 10, 55, 55); 
   
  translate(x, height/8-size/8); 
  fill(200); 
   ellipse(56, 46, 55, 55); 
   
     translate(x, height/5-size/2); 
  fill(255); 
  ellipse(0, 10, 55, 55); 
   
  translate(x, height/8-size/8); 
  fill(200); 
   ellipse(30, 46, 55, 55); 
   
    translate(x, height/95-size/2); 
  fill(255); 
  ellipse(90, 10, 55, 55); 
   
  translate(x, height/8-size/8); 
  fill(200); 
   ellipse(56, 46, 55, 55); 
   
     translate(x, height/5-size/2); 
  fill(255); 
  ellipse(0, 10, 55, 55); 
   
  translate(x, height/8-size/8); 
  fill(200); 
   ellipse(30, 46, 55, 55); 
   
  
} 


