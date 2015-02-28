
void setup() {
  size(600, 600);
  smooth();
  rectMode(CORNERS);
  frameRate(20);
  }
 
void draw() {
background(0);
strokeWeight(2);
stroke(150);
line(300,300,350,300);
line(325,300,325,325);
line(325,325,320,350);
line(325,325,330,350);
ellipse(325,290,10,15);
strokeCap(ROUND);
strokeJoin(ROUND);
strokeWeight(10);
stroke(255,0,0);
  fill(255);
   
  triangle(300,300,mouseX, mouseY, pmouseX, pmouseY);
 }
