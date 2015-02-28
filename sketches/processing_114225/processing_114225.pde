
int w = 40;
int h = 40;

// Declaring variables
float xPos = pmouseX ;
float yPos = pmouseY ;
float a = 100 ;
float b = 300 ;
float c = 300 ;
float d = 500 ;

void setup(){

size(600,600) ;
background(146,54,139) ;
mouseReleased();
xPos = width/4 ;
yPos = height/2 ;
if(xPos>=width){
  m=m*(-1) ;
} ;
} 



void draw() {
// Declaring the movement
  float xChange = cos(radians(a));
  float yChange = sin(radians(b));
  xPos += xChange *3;
  yPos += yChange *2;


  {//start interaction code
if (mousePressed == true) {
ellipse((pmouseX ), (pmouseY), (mouseX) , (mouseY));
fill(random(255),random(155),random(55));
//draws the circles at the mouse position

} else {

{
ellipse(xPos, yPos, 100, 100);
fill(random(255),random(255),random(255));
a=a-1 ;
b=b+6 ;

}



{
ellipse(xPos, yPos, 200, 200);
fill(random(255),random(255),random(255));
c=c-1 ;
d=d+6 ;


}
//changes the circles size depending on mouse position


}


}//close the interaction code




} ;
// Sets the animation start point to the mouse release point
void mouseReleased() {
xPos = mouseX ;
yPos = mouseY ;
}


//People who were not present: Dominic, Terry and James!!!


//Created by Keiran and Lewis! #TheWonderTeam 2k13
