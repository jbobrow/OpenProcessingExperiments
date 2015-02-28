
/*
 *Yueping Wang, Febuary 16, 2014;
 *"Ellipse-line Composition"
 *Homework for Flipped Coding, RISD ID, Spring 2014
 *Please move the cursor to alter the transparency.
 */

void setup(){
size (240,240);
background(157,149,211);
}
void draw(){
background(157,149,211);
noStroke();
ellipseMode(RADIUS);
fill(70,255,100,mouseX-20);
ellipse(120,120,90, 90);
strokeWeight(30);
strokeCap(ROUND);
stroke(255,255,0,mouseY-20);
line(0, 0,240,240);
}


