
 /*
Sketch Name  by Leigha Phillips, licensed under Creative Commons Attribution-Share Alike 3.0 and GNU GPL license.
Work: http://openprocessing.org/visuals/?visualID=XXXXXXX 
License: 
http://creativecommons.org/licenses/by-sa/3.0/
http://creativecommons.org/licenses/GPL/2.0/
*
Modified by: Cigdem Keskin
*/     
void setup() {
  size(500,500);
  stroke(random(0), 70);
  background(0);
} 
void draw() {
   
  fill(random(25),random(25),random(25), 7);
  rect(mouseX,mouseY,300,300);
   
  fill(random (255),random(0),random(0), 70);
  ellipse(mouseX,mouseY,300,300);
   
  fill(random(0),random(0),random(255), 70);
  ellipse(mouseY,mouseX,300, 300);
   
}

