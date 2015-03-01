
/*
 
John Cherry
Assignment #2 Create a character, logo or any illustration with processing (it does not have to be interactive).
DMS 110
 
*/

 
void setup() {  
  size(640, 480);
  background(255);  
}
 
void draw() {  
  background(90); 
  x = mouseX;
  y = mouseY;
  rectMode(CENTER);
  fill(x/2,y/2,45);
  rect(x,y,120,120);
  fill(x/3,y/3,100);
  ellipse(x+2, y +18, 90,10); 
  ellipse(x-30, y -20, 10,10);
  ellipse(x+30, y -20, 10,10);
  ellipse(x+2, y -2, 10,10);
  ellipse(x+2, y +27, 90,10); 
}
