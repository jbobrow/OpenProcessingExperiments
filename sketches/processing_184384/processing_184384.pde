
/*------------------------------
"Practice Interactivity"
Simple programming sketch practicing color changes depending on mouse location.

Created February 3, 2015
By Megan Cattey
megancattey@gmail.com

Created for Art 3001 - Programming for Artists
BFA in Art and Technology
The Ohio State University
http://www.openprocessing.org/classroom/4626

Sketch Location:
http://www.openprocessing.org/sketch/184384
 ------------------------------*/

void setup() {
  size(500, 400);
  smooth();
}

void draw() {
  background(150);
  if ((mouseX <250)&& (mouseX >100) && (mouseY >100) &&(mouseY<300)){
    fill(0);
  }
  
  if ((mouseX >250)&&(mouseX <300) && (mouseY >100) &&(mouseY<300)) {
    fill(255);
  }
  rect(100, 100, 300, 200);
}
