
//import processing.pdf.*;

float rr = 200;
float gg = 0;
float bb = 0;
float trans = 100;
float x = 0;
float y = 0;
float diam = 20;

void setup(){

 size (1000, 1000);
// beginRecord(PDF, "code8.pdf");
 background (255);
 smooth();
 frameRate(2000);
}

void draw ()
{
  trans = random(200);
  bb = random(0);
  gg = random(0);
  rr = random(255);
 
  noStroke();
  fill(rr,gg,bb,trans);
ellipse (x, y, diam, diam);
rect(y,x,diam , diam);
ellipse (y, x, diam, diam);
rect(x,y,diam , diam);
  
   x = x +30;
   
   if(x > 1000){
     y = y+45;
     x = 15;
     diam = 50;
   }
 //   if(y > 1000) {
  //  noLoop();
 //   endRecord();
 //   }
}

