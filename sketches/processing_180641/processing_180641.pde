
void setup() {
  size(360,360);
}




void draw() {
   
   
   background(102);
   int size = 10;
   for (int i=0; i < 10; i= i+1) {
     for (int j=0; j < 10; j= j+1) {
     println(i+j);
     rectMode(CENTER);
         if ((i+j)%2==0) {
               size = 20;
         }  else {
             size=10;
         } 
     pushMatrix();
     translate(90 + i*20, 90 + j *20);
     rect(0 , 0, size,size);
     popMatrix();
     }
     
   }
   
}




