
//Define class
class Person{

//variables
 int xpos;
 int ypos; 
 int xspeed;
 
//Constructor
 Person(int tx, int ty, int tspeed){
 xpos=tx;
 ypos=ty; 
 xspeed=tspeed;
 } 
  
//Function
void drawPerson(){
  noStroke();
  fill(106,105,105);
  rect(xpos,ypos,50,100);
  ellipse(xpos+25,ypos-45,120,120);
  ellipse(xpos+25,ypos+100,120,120);
}

//Function
void move(){
xpos = xpos + xspeed;
if ((xpos > width)||(xpos < 1)) {
  xspeed = -xspeed;
}
}  











}

