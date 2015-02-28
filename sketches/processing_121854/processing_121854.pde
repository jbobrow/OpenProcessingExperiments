
void setup() {
size(200,200); 
}

void draw() {
background(230);
ellipseMode(CENTER);
stroke(247,159,240);
fill(245,135,237);
ellipse(mouseX -30,mouseY -35, 20,30);
ellipse(mouseX +30,mouseY -35,20,30);
fill(202,0,5);
stroke(213,0,5);
ellipse(mouseX +30,mouseY +30,30,35);
fill(245,135,237);
stroke(247,159,240);
ellipse(mouseX,mouseY,80,80);
fill(202,0,5);
stroke(213,0,5);
ellipse(mouseX -30,mouseY +30,30,35);
fill(202,0,5);
stroke(200,0,5);
arc(mouseX,mouseY +10, 10, 15, 0, PI);
fill(37,24,188);
stroke(56,43,227);
ellipse(mouseX -10,mouseY -10,10,30);
ellipse(mouseX +10,mouseY -10,10,30);
}
