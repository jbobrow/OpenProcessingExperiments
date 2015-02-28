
//Definitions
float xpos;
float ypos;
float xpos2;
float ypos2;
float xpos3;
float ypos3;
float xpos4;
float ypos4;
float xpos5;
float ypos5;
float xpos6;
float ypos6;
 
//variables
float a = 90;
float a2 = 45;
 
void setup(){
  size (600,600);
  background (176, 226, 255); //background colour
 
//position of ellipses
xpos = width/2;
ypos = width/2;
xpos2 = width/2;
ypos2 = width/2;
xpos3 = width/2;
ypos3 = width/2;
xpos4 = width/2;
ypos4 = width/2;
xpos5 = width/2;
ypos5 = width/2;
xpos6 = width/2;
ypos6 = width/2; 
}
 
//setup for animation
void draw(){
 
stroke(54, 100, 139); //outline colour
fill(54, 100, 139); //ellipse colour
ellipse(xpos, ypos, 15, 15); //ellipse shape and size
 
stroke(60,60,200);
fill(60,60,200);
ellipse(xpos2, ypos2, 15, 15);
 
stroke(96, 123, 139);
fill(96, 123, 139);
ellipse(xpos3, ypos3, 15, 15);
 
stroke(0, 191, 255);
fill(0, 191, 255);
ellipse(xpos4, ypos4, 15, 15);
 
stroke(0, 104, 139);
fill(0, 104, 139);
ellipse(xpos5, ypos5, 15, 15);
 
stroke(28, 134, 238);
fill(28, 134, 238);
ellipse(xpos6, ypos6, 15, 15);
 
 
a=a+1; //line movments
a2=a2+6;
 
//movement of the ellipse
float yChange = cos(radians(a2));
float xChange = sin(radians(a));
 
//length on each arc
xpos += xChange*2;
ypos += yChange*5;
xpos2 -= xChange*2;
ypos2 -= yChange*5;
xpos3 += xChange*3;
ypos3 += yChange*2;
xpos4 -= xChange*3;
ypos4 += yChange*2;
xpos5 += xChange*-4.8;
ypos5 -= yChange*5;
xpos6 += xChange*4.8;
ypos6 += yChange*5;
}
