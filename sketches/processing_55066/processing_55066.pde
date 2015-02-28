
/*2c-1 by Sarah Sia
York/Sheridan

Coding by Alyssa C & Emilija Cookie & Cecilia Chen
*/
 
float x = 50.0;
float speed = 2.0;
float radius = 15.0;
 
float a = 0;
float b = 0;
 
void setup(){
size(250,250);
 
smooth();
noStroke();
ellipseMode(RADIUS);
frameRate(60);
}
 
void draw(){
//background  
fill(#ABFF3E, 20);
rect(0,0,width,height);
 
//redcircle
noStroke();
fill(#FF1803);
ellipse(x, 125, radius, radius);
 
//orangecircle
fill(#FF8400);
ellipse(110, x, 40, 40);
 
//lines
fill(#000000);
stroke(183, 6, 38);
rect(a++, 100, 0, 10);
 
b += speed;
if(b>125){
  b=-200.0;
}
 
a += speed;
if(a>250){
  a=-250.0;
}
x += speed;
if(x>125){
  x=-200.0;
}
}


