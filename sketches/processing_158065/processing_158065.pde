
float px=0;
   void setup(){
     size(600,400);
   }
   void draw()
 {
 if(px<width/2) {
   px++;
 }
  ellipse(px,100,10,10);
 
 
px++;
if(px>width/2){
   px=width/2;
 }
  ellipse(px,200,20,20);
 }
