
//week 1 assignment 4d

void setup() {
size(300,300);
background(255);
ellipseMode(CORNER);
rectMode(CORNER);
}

void draw() {
background(255);
strokeWeight(3);
ellipseMode(CORNER);
fill(mouseX,100,100);
ellipse((mouseX-50),(mouseY-25),100,50);
fill(255);
ellipseMode(CENTER);
ellipse((mouseX-25),(mouseY-20),20,20);
ellipse((mouseX+25),(mouseY-20),20,20);
point((mouseX-25),(mouseY-20));
point((mouseX+25),(mouseY-20));
strokeWeight(5);
line((mouseX-25),(mouseY+10),(mouseX+25),(mouseY+10));
}
