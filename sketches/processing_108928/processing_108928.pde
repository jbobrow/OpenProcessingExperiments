
//Madeline Chan mchan1@andrew.cmu.edu
//Copyright 2013 Madeline Chan
//Homework 3

float x,y,wd,ht;
 
void setup( )
{
 size(400,400);
   
 
  x=0;
  y=height;
  wd=width;
  ht=height;
  frameRate(10);
  
strokeWeight(1);

}
 
void draw ( )
{
fill(random(360),255,255,10);
 rect(0,0,width,height);

 
fill(random(255),random(255),random(255), 50);
noStroke();
  triangle(mouseX,mouseY,30,100,pmouseX,pmouseY);
  
if (mousePressed == true) {
  fill (255, 255, 224);
} else {
  fill(random(255), random(255), random(255), 20);
}
rect(30, 100, 40, 40);
}





