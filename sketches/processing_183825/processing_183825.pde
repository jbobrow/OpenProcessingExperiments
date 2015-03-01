

 
 
 void setup ()  {
   size (500,500); 
   frameRate(15);
   
 } 
 
 void draw () {
    
   
  fill(random(100), random (245), random(255),random(100)); 
  triangle (0, 0, random(500), random(500), random(500), random(500));
  
  triangle (500, 0, random(500), random(500), random(500), random(500));

  triangle (0, 500, random(500), random(500), random(500), random(500));

   
  fill(random(255), random (245), random(100),random(100)); 
  triangle (250, 250, random(500), random(500), random(100), random(100));
  
    fill(random(255), random (245), random(100),random(100)); 

  

  
   triangle (500, 500, random(500), random(500), random(500), random(500));

  

 }
  
 
 
 
