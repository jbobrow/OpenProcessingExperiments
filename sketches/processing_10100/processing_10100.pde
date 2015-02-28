

 
void setup() { 
  size(700, 700); 
  background(0); 
  smooth(); 
  loop(); 
} 
 
float a = 10; 
float b = 20; 
float c = 30; 
float d = 13; 


void draw() { 



  
 fill(random(255),random(600) , random(255), random(40)); 

  rect(a, b*2, c-3, d); 
    rect(a+10, b, c, d); 


  
  a = a + random(-0,60); 
  b = b + random(-0,84); 
  c += 0.31; 
  d += 0.05; 




  if (a > width) { 
    a = 0; 
    c = random(width); 
  } 
  if (b > height) { 
    b = 0; 
    d = random(width); 
  } 



 
  } if (c > height) { 
    c = 0; 
    b = random(width); 
  } } 

