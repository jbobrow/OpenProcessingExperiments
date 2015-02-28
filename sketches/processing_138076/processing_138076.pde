
   
   void setup(){
     
   
   size(500, 500);
  background(0);
  stroke(190);
  smooth();
   }
   
 
 void draw() {
 int a=1;
int b=1;
 
 
 while(a<=200){
    line(0,250,400,a+100);
    a=a+9;
        tint(2, 0,20); 

  }
  while(b<=2000){
    line(0,b,400,250);
    b=b+9;
    tint(2, 10,20); 
  }
  
 }


