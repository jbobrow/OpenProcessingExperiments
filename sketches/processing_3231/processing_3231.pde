
Pincel M; 
 
 
void setup(){ 
  size(500, 500); 
  background(0);  
  smooth(); 
   M = new Pincel();
} 
 
 
void draw(){ 
  M.dibuja(); 
} 
 
 
class Pincel{ 
  float x, y; 
  float diametro; 
  color col; 
 
  Pincel(){ 
    x = random(height); 
    y = random(width); 
    diametro = 1; 
     
  } 
 
  void dibuja(){ 
    calc(); 
     stroke(0); 
     
} 
   
 
  void calc(){ 
    x += random(10, -50); 
    y += random(50, 10); 
     
     x = y % width ; 
    y = x % height;
     
      
    
   fill(0);
  stroke(255);
  strokeWeight(1);
  
  
  ellipse(x,y, diametro, diametro); 
  
 
 fill(100,y,x);
 noStroke();
ellipse(diametro, x, y, diametro); 
    
     
  } 
} 
 
 
void mousePressed(){ 
 M.diametro += 1;  
} 


