
int x;            // X-coordinate
int y;             // Y-coordinate
int xSpeed;
int ySpeed;
color gray;
color green; 


void setup() {
size(400,400);
colorMode(HSB, 360, 100, 100);
gray= color(0,0,77);
green = color(161,80,86);

smooth();
//start position
x=0;
y=0;
//set initial speed
xSpeed=10;
ySpeed=6;
}

void draw() {

 x=x+xSpeed;
y=y+ySpeed;

//right boundary
if (x >= width) {
  xSpeed = xSpeed * -1;
  //or xSpeed = -xSpeed
  
}
//left boundary
if ( x<= 0){
   xSpeed = xSpeed * -1;
  
}
//bottom boundary
if (y >= height){
   ySpeed = ySpeed * -1;
}
//top boundary
if ( y<= 0){
  ySpeed = ySpeed * -1;
} 
 
  background( y, 99, 99);

fill(gray);

//feet
ellipse(x + 55, y +45, 25, 25);
ellipse(x + 22, y +58, 25, 25);

//body
ellipse (x,y, 170, 130);
ellipse(x-50,y+10, 110, 65);
ellipse(x-50,y+ 50, 150, 75);

//eyes
fill(0);
ellipse(x- 20,y+9,4,4);
ellipse(x- 80,y+9,4,4);

//nostrils
ellipse(x- 40,y+70,2,2);
ellipse(x- 60,y+70,2,2);
}
