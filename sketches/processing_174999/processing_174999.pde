
int circleY=100;
int speed = 5;
void setup(){
  size(600,600);
  smooth();
}
void draw() {
  if(mousePressed) {
  background(#7A0193);
  circleY=circleY + speed;
  if (circleY > height || circleY < 0)
  speed=speed * -1; //reverse course
  //Display the circle as x location 
  //What will this do?
  stroke(0);
  fill(#A72030);
  ellipse(300,circleY,83,83);
  
  fill(222,9,194);
rectMode(CORNER); // rectangle 
rect(4,5,200,200); // 
  }



}
 
 


