
//*credit to Lindsey Baker for code - http://www.openprocessing.org/visuals/?visualID=51216
//* I (Sol Escalada) used the code as a base to ellaborate and change into my personalized version

void setup() {
  size(600,300);
  background(0);
}
 
void draw() {
  smooth();
 noFill();
  noStroke();

//*random function for fill of the ellipses is from Vishal Agrawal's "HW3" - http://www.openprocessing.org/visuals/?visualID=50669
//*sol escalada used the random function, and addedd the rest herself (ellipse, strokeweight, stroke, triangle, fill, smooth)
smooth();
fill(225,155);
  rect(mouseX,mouseY,25,25);
  noStroke();




//*sol escalada used the void functions learnt in the class lecture (clicked & dragged) to change the background colour

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

