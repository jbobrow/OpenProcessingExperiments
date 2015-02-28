
float r= 20;
float a =0;
 void setup(){
   size (500,500);
   background (163,162,162);
   smooth ();
   stroke (186,195,216,20);
   strokeWeight (1);
  
 }
 
 void draw (){
   float x = r * sin (a);
   float y = r * cos (a);
   float vuw = random (50);
   float x1 = r * cos (a);
   float y1 = r * sin (a);
   fill(random(252),random(251),244,10);
    
  
     ellipse (width/2 + y , height/2 + x ,50,50);
       ellipse (width/2 + y1, height/2 +x1,50,50);
         
   a += 0.1;
   r +=0.2;
   if (x>500);
   x = 0;
   if (y>500);
   y = 0;
   
 }
