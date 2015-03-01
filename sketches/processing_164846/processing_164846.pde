


void setup() {
size(500, 500);
noStroke();
}
void draw() {
  background(255,241,0);
  noStroke();
 
fill(0);
ellipse(mouseX,mouseX,50,50);
fill(255,255,255);
ellipse(mouseY,mouseY,50,50);
fill(210,30,0);
ellipse(mouseY,mouseX,50,50);
 
textSize(32);
fill(255,0,0);
text("+",mouseX,mouseY);
fill(255,255,255);
text("*",mouseX,mouseX);
fill(0,0,0);
text("*",mouseY,mouseY);
}




