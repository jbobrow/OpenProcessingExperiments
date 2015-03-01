
//starting angle
float theta= 0.0;

void setup(){
  
  size(400,400);
  smooth();
}

void draw(){
background(255);
// increasing theta 
theta +=0.02;

 noStroke();
 fill(0);
 
 float x = theta;
 for (int i = 0; i <=30 ; i++ ){
   // calculate sin of Y
   float y= (sin(x)*width/2);
   ellipse(i*30,y+height/2,16,16);
   //move along X- axis
   x+=0.2;
 }
 }
 



