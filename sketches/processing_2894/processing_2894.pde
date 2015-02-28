
float R, P; 

void setup(){ 
  R=35;  // variable 1
  P=20;  // variable 2
  size(500,500); 
  smooth(); 
} 
 
void draw(){ 
  background (0); 
   
  for(float y=  R/2; y <= height-R; y += P*3){ 
    for (float x = R*2; x <=width-R; x += P){ 
    
      float T; 
   T= 130 - sqrt((mouseX - x)*(mouseX - x)+(mouseY - y)*(mouseY -y)); 
      
      fill(mouseX,mouseY, 150, 200); 
      ellipse(x, y, T, 90/T);   
      strokeWeight(30); 
      
      fill(mouseX, mouseY, 70, 200);
      ellipse(mouseX, mouseY, T/100, T/100);
      strokeWeight(15);
        
smooth(); 
stroke(200,10); 
fill(147, 7, 68, 100); 
triangle(y, x , T, T, T, T); // Crea un tipo de malla, similar a un destello de luz

      
} 
} 
} 
 
 

