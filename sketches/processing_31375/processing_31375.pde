
int hello = 55;
int goodbye = 10;

void setup(){
  size(500,500);
  background(255);
  
  line(0,0,hello,hello);
  
 }
 
 void draw(){
   line(goodbye,20,hello,hello);
   hello = hello + 1; 
   goodbye = goodbye + 100;
 }

