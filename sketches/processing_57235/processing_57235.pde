
float r= 20;
float a =0;
 void setup(){
   size (500,500);
   background (234,221,224);
   smooth ();
   stroke (186,195,216,10);
   strokeWeight (1);
  
 }
 
 void draw (){
   float x = r * sin (a);
   float y = r * cos (a);
   float vuw = random (50);
   fill(random(211),random(211),212,20);
    
  
     ellipse (width/2 + x , height/2 + y ,x/3.5,x/1.5);
      ellipse (width/2+y, height/2+x,x/3.5,x/1.5);
        
   a += 1;
   r +=0.7;
   if (x>500);
   x = 0;
   if (y>500);
   y = 0;
   
 }
