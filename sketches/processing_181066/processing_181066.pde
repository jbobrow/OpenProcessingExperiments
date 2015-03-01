
void setup() {
  size(360,360);
}




void draw() {
   background(102);
   int size = 100;
   float fc =  frameCount/ 50.0;
   println("fc:" + fc);
   for (int i=0; i < 2; i= i+1) {
     for (int j=0; j < 10; j= j+1) {
     
     
     pushMatrix();
         if ((i+j)%2==0) {
             size = 20;
     
         }  else {
             size=10;
             
         } 
     
     translate(120+ i*20, 90 + j *20);
        if ((i+j)%2==0) {
             fill(216,61,61);
             size = 30;
             rotate(fc);
         }  else {
             fill(22,93,183);
             size=30;
             rotate(-fc);
         } 
     
     rectMode(CENTER);
     rect(0 , 0, size,size);
     
     popMatrix();
     }
     
   }
   
}




