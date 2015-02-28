
//Luis Martinez 10 January 2014

void setup() 
{
  size(400, 400); //This is the size of the window...
}
void draw() 
{
  background( 255, 0, 0);
 
  fill(0, 0, 255);
  ellipse (200, mouseY-100, 100, 100); //This is the head....
  rect(150, 150, 100, 100); //This is the body...
  
  fill(255, 255, 255);
  ellipse(175, mouseY-100, 30, 30); //These are the eyes...
  ellipse(225, mouseY-100, 30, 30);
  
  fill(0);
  triangle(250, mouseY-175, 250, 200, 325, 188); //These are the arms...
  triangle(150, mouseY-175, 150, 200, 75, 188);
  
  fill(0, 255, 0);
  rect(225, 250, 50, 20); //These are the legs...
  rect(125, 250, 50, 20); 
  line(50, 275, 350, 275); //This is the base line...
}
void mousePressed(){
  println("Take me to your leader!");
}
