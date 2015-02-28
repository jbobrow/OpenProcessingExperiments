

 void setup (){
   size(250,250);
   background(127,0,0,255);
 }
 
 void draw (){
 fill(255,50);
 stroke(127,0,0,255);
 }
 void mouseDragged (){
   triangle(pmouseX,pmouseY,pmouseX,5,10,5);
 }

