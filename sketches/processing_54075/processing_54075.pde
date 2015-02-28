
//*credit to Lindsey Baker for code - http://www.openprocessing.org/visuals/?visualID=51216
//* I used the code as a base to ellaborate and change into my personalized version

void setup() {
  size(600,300);
  background(0);
}
 
void draw() {
  smooth();
 noFill();
  strokeWeight(2);
  stroke(mouseX/2,mouseY/2,50,100);
triangle (mouseY,mouseY,mouseX,mouseX,mouseX,mouseX);
//*random function for fill of the ellipses is from Vishal Agrawal's "HW3" - http://www.openprocessing.org/visuals/?visualID=50669
smooth();
fill(random(0,255), random(0,255), random(0,255),50);
  ellipse(mouseX,mouseY,width/5,height/5);
  strokeWeight(1);
  stroke(mouseX/2,mouseY/2,50,100);
triangle (mouseX,mouseX,mouseX,mouseX,mouseX,mouseY);




}
void mouseClicked() {
  background(mouseX/2,mouseY/2,50,100);
}
void mouseDragged() {
  background(mouseX/2,mouseY/2,50,100);
  
  
}
 
void keyPressed() {
  background(145);
}


