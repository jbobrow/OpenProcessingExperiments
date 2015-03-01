
float a=0;
float b=50;

void setup(){
  
  size(500,500);
  background(255,255,255);
  
}
 void draw(){
   translate(width/2, height/2);
   rotate(a);
   
   a=a+1;
   
   rect(50,50,100,100);
   b=b+5;
   
 }


