
/*
SCIMA-200-05 | Math Programming and Art
Homwwork 20130923
William Felker
Homework for 2013_09_30


HOMEWORK

add at least 4 variables to your
previous homework (or start a new sketch)


make them control
position, size, and/or color
  


write a lot of code
try a lot of stuff


*/

float xPos;
float yPos;
float xmove;
float ymove;



void setup(){

   size(1280,720);
   xPos=2;
   yPos=10;
   xmove=2;
   ymove=10;
  

}


void draw(){
  
  //rect(0, 0, 1280, 720,);
  
  //Top
  
  fill(mouseX/xPos,mouseX/xPos,50,50);
  rect(00,360,60,-360);
  rect(60,360,100,-360);
  rect(160,360,100,-360);
  rect(260,360,100,-360);
  rect(460,360,100,-360);
  rect(360,360,100,-360);
  rect(560,360,100,-360);
  fill(mouseY/yPos,mouseY/yPos,50,50);
  rect(660,360,100,-360);
  rect(760,360,100,-360);
  rect(860,360,100,-360);
  rect(960,360,100,-360);
  rect(1060,360,100,-360);
  rect(1160,360,100,-360);
  rect(1260,360,100,-360);
  
  
  
  
  //Bottom
   fill(mouseX/xmove,mouseX/xmove,50,50); 
  rect(00,360,60,360);
  rect(60,360,100,360);
  rect(160,360,100,360);
  rect(260,360,100,360);
  rect(460,360,100,360);
  rect(360,360,100,360);
  rect(560,360,100,360);
  fill(mouseY/ymove,mouseY/ymove,50,50);
  rect(660,360,100,360);
  rect(760,360,100,360);
  rect(860,360,100,360);
  rect(960,360,100,360);
  rect(1060,360,100,360);
  rect(1160,360,100,360);
  rect(1260,360,100,360);
  
  
  //rect(100,100);
  //rect(100,100);
  
  
  fill(mouseX,mouseY,187,50);
  quad(0, 0, 640, 0, mouseX, mouseY, 0, 360); // Upper Left
  fill(117,255,187,50);
  quad(640, 0, 1280, 0, 1280, 360, mouseX, mouseY); // Upper Right
  fill(mouseX,mouseY,mouseX,50);
  quad(0, 361, mouseX, mouseY, 641, 720, 0, 720); // Lower Left
  fill(117,255,187,50);
  quad(mouseX, mouseY, 1280, 361, 1280, 720, 641, 720); // Lower Right
 
 stroke(mouseX-mouseY/2);
 line(mouseX,0,mouseX,720);
 line(0,mouseY,1280,mouseY);
 
}


