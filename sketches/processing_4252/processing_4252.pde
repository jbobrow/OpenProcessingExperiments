

  
float x, y; 
float size = 20; 
 
void setup()  
{ 
  size(400,400); 
  noStroke(); 
  frameRate(15);
} 
 
void draw()  
{ 
  background(0); 
   
  x = x + 5; 
   
  if (x > width + size) { 
    x = -size; 
  }  
   
  translate(x, height/95-size/2); 
  fill(255); 
  ellipse(90, 10, 55, 55); 
  rect(55, 30, 70, 100);
  
    translate(x, height/95-size/2); 
  fill(255); 
  ellipse(40, 90, 55, 55); 
  rect(5, 110, 70, 100);
  
    translate(x, height/95-size/2); 
  fill(255); 
  ellipse(90, 10, 55, 55); 
  rect(55, 30, 70, 100);
  
   translate(x, height/95-size/2); 
  fill(255); 
  ellipse(40, 90, 55, 55); 
  rect(5, 110, 70, 100);
  
    translate(x, height/95-size/2); 
  fill(255); 
  ellipse(80, 300, 55, 55); 
  rect(45, 325, 70, 100);
  
    translate(x, height/95-size/2); 
  fill(255); 
  ellipse(80, 300, 55, 55); 
  rect(45, 325, 70, 100);
  
    translate(x, height/95-size/2); 
  fill(255); 
  ellipse(90, 10, 55, 55); 
  rect(55, 30, 70, 100);
   
} 


