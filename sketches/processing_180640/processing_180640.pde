
void setup() {
  size(640,360);
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
       rect(20 + i*20 , 20 + j *20, size,size);
     }
     
   }
   
}




