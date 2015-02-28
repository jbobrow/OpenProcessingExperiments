
//copyright © Kelechi Edozie- Anyadiegwu 2013
//Computer Arts w/ Processing
//Homework 3

float x, y,wd,ht, startx, starty;

void setup()
{
 
  size(400,400);
  smooth();
  background(160 ,6,158);
  
}

void draw()
{
 x=random(50,350);
 y=random(50,350);
 wd=random(10,200);
 ht=random(10,200); 
 startx=200;
 starty=200;
 
 noStroke();
 fill(200, random(255), random(255),10);
 ellipse(mouseX,mouseY,wd,ht);
 stroke(255,25);
 line(startx,starty,mouseX,mouseY);
 
 //ellipse(mouseX,mouseY,wd,ht);
 
  //strokeWeight(2);
  //stroke(16,87,random(255),20);
  //stroke(255, 144, random(255));
 //stroke(16,87,random(255),20);
 
 
  //line(mouseX,mouseY, random(1,100),random(1,100));
 
 // ellipse(mouseX,mouseY,wd/10, ht/10);
// ellipse(x, y, wd,ht);
  
 
}
//saveFrame("hw3.jpg");





