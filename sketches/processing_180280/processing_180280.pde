
float a=0;
float b=50;
float c=0;
float d =80;

void setup(){
  
  size(500,500);
  background(255,255,255);
  
}
 void draw(){
   translate(width/2, height/2);
   rotate(a);
   
   a=a+1;
   
   strokeWeight(c);
   stroke(0,255,d);
   rect(b,50,100,100);
   b=b+1;
   c=c+0.05;
   d=d+1;
   
 }


