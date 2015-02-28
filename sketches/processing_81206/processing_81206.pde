
/*
Coding by Alyssa C
 
Editing by Cecilia Chen
YSDN 2012
Project 3 
 
*/

PImage img; 
float speed = 2.0; 
float a = 80.0;
float b = 80.0; 
float c = 80.0; 
float d = 80.0; 
float radius = 20.0;
 
void setup(){
size(400,400);
img = loadImage ("bottle.png");  
smooth();
noStroke();
ellipseMode(RADIUS);
}
 
void draw(){
//* background *//  
image(img,0,0); 
 

 
//*moving circle*//
fill(#cefbff, 90);
ellipse(230, 400+a, 3, 3);
 
//*moving circle*//
fill(#fffece, 90);
ellipse(150, 400+b, 3, 3);
 
//*moving circle*//
fill(#cefff1, 90);
ellipse(180, 400+c, 2, 2);
 
 


 
 
a += speed;
if(a>10){
  a=-82;
}
//*large circle*//  
b += speed;
if(b>10){
  b=-30;
}
//*most left circle*// 
c += speed;
if(c>10){
  c=-350;

}


}


