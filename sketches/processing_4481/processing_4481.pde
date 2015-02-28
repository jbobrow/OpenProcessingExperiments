
float margen, sp; 
 
void setup(){ 
  noCursor(); 
  margen = (float)mouseX; 
  sp = 25; 
  size(600,600); 
  smooth(); 
  background(126,222,245); 
} 
  
void draw(){ 
  background(126,222,245); 
   
  for(float x = margen; x <= width; x += sp ){ 
    for(float y = margen; y <= height; y += sp){ 
      float d; 
      d = sqrt(((float)mouseX - x)*((float)mouseX - x) + ((float)mouseY - y)*((float)mouseY - y)); 
     
      fill(#FF0000,(float)mouseX);
      stroke(#B100B4,(float)mouseY); 
      ellipse (x,y, d/12, d/12); 
 
    
      fill(#A4FAB7,(float)mouseY); 
      stroke(#A4FAB7,(float)mouseX); 
      ellipse (x,y, d/12, d/10); 
 

      fill(#9844FA,(float)mouseX); 
      stroke(#9844FA,(float)mouseY); 
      ellipse (x,y, d/12, d/10); 
   
      fill(#FA9344,(float)mouseY);
      stroke(#FA9344,(float)mouseX); 
      ellipse (x,y, d/12, d/10); 
 
    } 
  } 
} 
 


