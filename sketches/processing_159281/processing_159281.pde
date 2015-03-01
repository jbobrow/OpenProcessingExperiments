
//week 1 assignment 4b

void setup() {
size(300,300);
background(255);
ellipseMode(CORNER);
rectMode(CORNER);
}

void draw() {
strokeWeight(3);
ellipseMode(CORNER);
fill(mouseX,100,100);
ellipse(100,150,100,50);
fill(255);
ellipseMode(CENTER);
ellipse(125,150,20,20);
ellipse(175,150,20,20);
strokeWeight(5);
line(125,175,175,175);
}
