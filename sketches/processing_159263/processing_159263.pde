
void setup() {
size(200,400);
smooth();
strokeWeight(2);
stroke(255);
fill(0,0,255);
}

void draw() {
background(mouseX,mouseY,80);
line(pmouseX,pmouseY,mouseX,mouseY);
ellipse(mouseX,mouseY,0,200);
}
