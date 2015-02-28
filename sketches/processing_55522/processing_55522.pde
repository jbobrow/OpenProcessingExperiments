
//*credit to Lindsey Baker for basic code - http://www.openprocessing.org/visuals/?visualID=51216
//* I (Sol Escalada) used the code as a base to ellaborate and change into my personalized version
//reference: SofÃ­a Quintana - http://openprocessing.org/sketch/3075//
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
fill(random(0,255), random(0,255), random(0,255),50);
   ellipse(75,225,mouseX,mouseX);
      ellipse(175,225,mouseX,mouseX);
      ellipse(275,225,mouseX,mouseX);
           ellipse(375,225,mouseX,mouseX);
           ellipse(475,225,mouseX,mouseX);
           ellipse(575,225,mouseX,mouseX);
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

