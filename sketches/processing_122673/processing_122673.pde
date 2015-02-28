

void setup() 

{ 
  size(800, 800); 
    background(20, 22, 67); 
} 
void draw() 
{ 

  noStroke(); 
     
  {int sec = second()*10; 
  fill(252, 252,94); 
  noStroke(); 
  ellipse(200, 200, sec, sec); 
  } 
  
  {int min = minute()*4; 
  fill(94, 211, 252);
  noStroke(); 
  ellipse(600, 400, min, min); 
  } 
 
  {
    int h = hour()*4; 
   fill(165, 252, 94); 
  noStroke(); 
  ellipse(300, 600, h, h); 
  } 

} 
