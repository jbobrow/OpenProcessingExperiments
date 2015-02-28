
float rx, ry;
float ex,ey;
float Rwidth;
float Rheight;
float Ediameter;

 void setup(){
 size(600,600);
 //background(246);
 rx= 300;
 ry= 300;
 Rwidth= 0;
 Rheight= 0;
 ex= 300;
 ey= 300;
 Ediameter= 0;

 noFill();
 
 }
 
 void draw(){
   background(246);
   
   rectMode(CENTER); 
   ellipseMode(CENTER);
   rect(rx,ry,Rwidth,Rheight);
   
      Rwidth ++ ;
      Rheight ++ ;
   
   if(Rwidth >= 100){
      Rwidth = -Rwidth ;
     }

 if(Rheight >= 100){
    Rheight = -Rheight ;


 }
 
   ellipse(ex,ey,Ediameter,Ediameter);
 
   Ediameter +=2;
 
   if(Ediameter >= 400){
     Ediameter= - Ediameter;
   }
 
     
   
 }

