
/*
Coding by Alyssa C & Emilija Cookie 

Editing by Cecilia Chen 
YSDN 2012 
Project 2c Attract 

*/

float x = 50.0;
float speed = 1.0;
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
//* background *//   
fill(#a58163, 20);
rect(0,0,width,height);

//*circle_yellow*// 
fill(#feff93);
ellipse(x, 125, radius, radius);

//*circle_pink*// 
fill(#ff87af); 
ellipse(200, x, 20, 20); 

//*lines*// 
fill(#14ff1f); 
stroke(183, 6, 38);
rect(a++, 100, 0, 10);

fill(#6ee5ff); 
noStroke();
rect(b, 10, 50, b++);

//*rectangle*// 
fill(#c5c5c5); 
noStroke();
rect(123,90,100,80);

b += speed; 
if(b>150){ 
  b=-100.0;
} 

a += speed; 
if(a>150){ 
  a=-200.0; 
}
x += speed;
if(x>150){
  x=-200.0;
}
}

