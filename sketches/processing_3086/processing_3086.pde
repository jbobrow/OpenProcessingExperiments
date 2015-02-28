
float margen, sp; 
 
void setup(){ 
 margen = 5; 
  sp = 30; 
  size(500, 500); 
  smooth(); 
} 

void draw(){ 
  background(#0E068B,100); 
  for(float y =margen; y <= height-margen; y += sp){ 
    for(float x = margen; x <= width-margen; x += sp){ 
      float d;
      d = 100 - sqrt((mouseX - x)*(mouseX - x) + (mouseY - y)*(mouseY - y)); 
     
    noStroke(); 
      fill(x,y,78 , 100); 
rect(mouseX,y, 10/d, 5/d);  
rect(x,mouseY, 10/d, 5/d);  

   d= 100 - sqrt((mouseX - x)*(mouseX - x)+(mouseY - y)*(mouseY -y)); 
     fill(mouseX,mouseY,56,34); 
      rect( x,y, d,d); 

    } 
  } 
} 



