
float r= 20;
float a =0;
 void setup(){
   size (500,1000);
   background (245,217,217);
   smooth ();
   stroke (186,195,216);
   strokeWeight (7);
  
 }
 
 void draw (){
   float x = r * cos (a);
   float y = r * sin (a);
   float vuw = random (50);
   fill(random(200),random(122),128);
    
  
     ellipse (width/1.2 + y , height/4.5 + x ,50,50);
       ellipse (width/5 + y , height/1.5 + x ,50,50);
      
         
   a += 0.1;
   r +=0.3;
   if (x>500);
   x = 0;
   if (y>500);
   y = 0;
   
 }

