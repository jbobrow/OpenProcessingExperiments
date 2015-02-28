
/*Konkuk University
Department of Dynamic Media
SOS iDesign
Name:CHOE Goeun
ID:201420111
*/

float a = 0;
float b = 0;
float c = 50;
float x = 30;
float y = 20;
float angle = 50;
float xPos=0;
float diameter=30;
float destination;
float yPos= width;

void setup(){
size (600, 600);
background(#8b0e0e);
noStroke();
smooth();
rectMode(CENTER);
xPos=0;
destination = width + diameter *2;}

void draw(){
//TOP,BOTTOM CIRCLES
if (mousePressed == true){
float distance = destination - xPos;
xPos = xPos + distance / 60;
if (xPos > width + diameter){
  xPos = -diameter; }
  
fill(random(255));
ellipse(xPos,50,diameter,diameter);
ellipse(width-xPos,550,diameter,diameter);
ellipse(550, xPos,diameter,diameter);
ellipse(50, width-xPos,diameter,diameter); }

//CENTER RECTS
 pushMatrix();  
  frameRate(120);
  translate(width/2,height/2);
  rotate(angle);
  scale(0.2);

 a = a + c;
 b = b + c;
 if ((a>width) || (a < 0))
 if ((b>width) || (b < 0)){
   c = c *-1;
}
 fill(random(255),random(255),random(255));
 rect(a,b,x,x);
 angle += 0.01;
 x = x + (1*y);
   if ((x <0)||(x>120)) {
   y*=-1; }
 popMatrix();
}
