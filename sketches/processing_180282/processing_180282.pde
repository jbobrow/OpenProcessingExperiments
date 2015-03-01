
float a=0;
float b=3;
float c=10;
float d =80;

void setup(){
  
  size(500,500);
  background(255,255,255);
  
}
 void draw(){
   translate(width/2, height/2);
   
   
   
   
   strokeWeight(c);
   stroke(0,255,d);
   pushMatrix();
   rotate(a);
   translate(100,10);
   rect(b,3,100,100);
   
   b=b+1;
   c=c+0.05;
   d=d+1;
   
   popMatrix();
   rotate(a);
   stroke(d);
   translate(100,10);
   rect(b,3,100,100);
   
   a=a+1;
   b=b+1;
   c=c+0.05;
   d=d+1;
   
 }


