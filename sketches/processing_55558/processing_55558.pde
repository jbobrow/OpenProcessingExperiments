
/*
Coding by Alyssa C 

Editing by Cecilia Chen 
YSDN 2012 
Project 2c Emerge

*/

float a = 80.0;
float speed = 3.0;
float radius = 20.0;

void setup(){
size(250,250);

smooth();
noStroke();
ellipseMode(RADIUS);
}

void draw(){
//* background *//   
fill(#a58163, 20);
rect(0,0,width,height);

//*rectangle*// 
fill(#97ff86, 20); 
rect(0,70, width, 5); 

//*rectangle*// 
fill(#97ff86, 20); 
rect(0,130, width, 10); 

//*moving circle*//
fill(#ff87af); 
ellipse(100, 50-a, 10, 10); 

//*moving circle*//
fill(#ff87af); 
ellipse(200, 40-a, radius, radius); 

//*moving circle*//
fill(#ff87af); 
ellipse(40, 30-a, 5, 5); 


//*moving circle*//
fill(#ff87af); 
ellipse(60, 20-a, 5, 5); 

//*rectangle*// 
fill(#77dff2);
rect(0,150, width, 100); 


//*rectangle*// 
fill(#97ff86); 
rect(0,100, width, 20);



a += speed;
if(a>10){
  a=-300;
}
}

