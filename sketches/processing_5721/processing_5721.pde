

int diameter = 40;
int xpos = 100;
int ypos = 75;
int xsize = 200;
int ysize = 150;

void setup(){
  size(400, 300);
  background(128);
  smooth();
  strokeWeight(10);
  strokeJoin(ROUND);
}
void draw() {
  if (keyPressed) {
    if (key == 'r') {
      //diameter = mouseX;
      diameter = constrain(mouseX, 0, xsize);
      diameter = constrain(mouseX, 0, ysize);
    } 
  } 

  if (keyPressed) {
    if (key == 's') {
      xsize = constrain(mouseX,diameter,width - xpos);
      ysize = constrain(mouseY,diameter,height  - ypos);
    }
  } 

  if (keyPressed) {
    if (key == 'p') {
      xpos = mouseX;
      ypos = mouseY;
    } 
  }
  background(128);
  fill(255);
  stroke(0);
  strokeWeight(diameter);
  rect(xpos + diameter /2, ypos + diameter/2, xsize - diameter, ysize - diameter);
  noStroke();
  fill(color(255,0,0));
  ellipse(xpos + diameter /2, ypos + diameter /2, diameter, diameter);
  fill(255);
  rect(xpos + diameter /2, ypos + diameter /2 , xsize - diameter, ysize - diameter);
}








