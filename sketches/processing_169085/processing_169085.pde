
size(400,400);
 noStroke();    
 for (int i = 0; i < 3000; i++) { 
  
   float x = random(width);
   float y = random(height);
  
   float r = random(255); 
   float g = random(255); 
   float b = random(255); 
   
   fill(r, g, b);      
   ellipse(x, y, 18,18); 
 }



