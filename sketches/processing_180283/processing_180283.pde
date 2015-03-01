
float a=50;
float b=100;
float c=100;
float d=300;

void setup(){
  
  size(500,500);
  background(255,255,255); //White Background
  
}
 void draw(){
   
  
   rotate(b);
   fill(255,0,0);
   rect(200,0,50,b); //draw red rectangle
   
   pushMatrix();
   rotate(a);
   translate(10,10);
   fill(100,b,a);
   rect(200,200,b,50); //draw green to blue rectangle
   popMatrix();
   a=a+0.9;
   b=b-5;
   d=d+1;
   
   rotate(b);
   translate(10,10);
   fill(a,0,255);
   rotate(b);
   rect(100,200,b,50); //draw blue to pink rectangle

   a=a+0.5;
   b=b+10;
   c=b+0.5;
 }


