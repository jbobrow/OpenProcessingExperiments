
float r= 20;
float a =0;
float w = 200;
float z = 200;
 void setup(){
   size (500,500);
   background (252,251,244);
   smooth ();
   stroke (186,195,216,50);
   strokeWeight (1);
  
 }
 
 void draw (){
   float x = r * cos (a);
   float y = r * sin (a);
   float vuw = random (50);
   
   
   fill(random(159),random(159),160,20);
    
  
     ellipse (width/2+x, width/2+y,w,z);
  
         
   a += 1;
   r +=0.1;
   if (x>100);
   x = -1;
   if (y>100);
   y = -1;
   
 }
