
float margen, sp; 
void setup(){ 
  sp=50; 
  size(500,500); 
  smooth(); 
} 
 
void draw(){ 
  background (255); 
   
  for(float y=  margen; y <= height-margen; y += sp*4){ 
    for (float x = margen; x <=width-margen; x += sp){ 
    
      float d; 
   d= 10 - sqrt((mouseX - x)*(mouseX - x)+(mouseY - y)*(mouseY -y)); 
     fill(mouseX,mouseY,200,100); 
     rect(x,y,d,d);
      rect(x,y,d,250);
      ellipse(x,y,d,d);
      stroke(0);
      
      
      
} 
} 
} 
 
 


