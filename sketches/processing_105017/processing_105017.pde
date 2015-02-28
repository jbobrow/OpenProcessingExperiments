
/*the order of lines inside void draw is important
reminds me C++
be faster and faster
*/


float xPos;
float yPos;
float velocity;
void setup(){
  size(500,500);
  xPos=width/2;
  yPos=height/2;
  velocity=1;
}
  
void draw(){
noStroke();
background(0,162,135);
fill(255,103,0);
ellipse(xPos,yPos,35,35);
xPos=xPos+velocity;
if(xPos<500||xPos>0){
velocity= 1.01*velocity;
//go faster, go faster,go faster
}
if(xPos>500||xPos<0){
velocity= -velocity;
//when ball is hitting border, the direction changes
}
}
   
  


