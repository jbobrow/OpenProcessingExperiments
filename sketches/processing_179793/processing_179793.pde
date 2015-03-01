

int x = 25;       
int y = 25;
// velocity (9,5)
int dx = 12;         
int dy = 4; 

void setup() {  
  size(500, 500); 
  background(255); 
} 

void draw() {  
  
background(255);

  ellipse(x,y,20,20);
 //location of ball 
  x = x + dx; 
  y = y + dy; 
 // X axis collision
  if (x > 500) {        
      dx = -12; 
  } 


  else if (x < 0) { 
      dx = 12; 
  } 

  // Y axis collision 
  if (y > 500)  {     
      dy = dy*(-1);       
  } 


  else if  (y <0){  
      dy *= -1; 
  } 
} 




