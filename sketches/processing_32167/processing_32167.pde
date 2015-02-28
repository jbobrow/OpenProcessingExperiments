
float r= 20;
float a =0;
 void setup(){
   size (500,1000);
   background (245,217,217);
   smooth ();
   stroke (186,195,216);
   strokeWeight (5);
  
 }
 
 void draw (){
   float x = r * sin (a);
   float y = r * cos (a);
   float vuw = random (50);
   fill(random(200),random(122),128);
    float cheers = random(x/3);
  float thx = random(y/3);
     ellipse (width/2 + y , height/2 + x ,y/2,x/2);
      
         
   a += 1.8;
   r +=0.3;
   if (x>500);
   x = 0;
   if (y>500);
   y = 0;
   
 }

