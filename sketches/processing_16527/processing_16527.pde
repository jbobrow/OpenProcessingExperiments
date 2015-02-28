
void setup()

{
 size(800,600);
 smooth();
 background (255);
}
 
 
void draw()

{
  

 float a=10*width/height;
    
  float  b=random(a);
    
   noStroke();
   
   fill (random(255),random(255), random (255,random(255)));
   ellipse (random(width),random(height),b,b );
        
    
   frameRate (100);
  
  
 }
                                
