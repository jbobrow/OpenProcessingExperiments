
void setup() {
size(300, 300);
smooth();
}

void draw() {
background(mouseY, mouseX, mouseX-mouseY);
fill(255, 25);
arc(75, 150, 125, 125, -1.83, 1.83, CHORD);
fill(255, 50);
arc(80, 150, 95, 105, -1.83, 1.83, CHORD);

fill(0,0);
strokeWeight(3);

beginShape();
vertex(175 ,150);
quadraticVertex(130, 140, 175, 175);
quadraticVertex(212, 210, 145, 210);
endShape();

beginShape();
vertex(225 ,150);
quadraticVertex(180, 140, 225, 175);
quadraticVertex(262, 210, 195, 210);
endShape();

println("x=" + mouseX +  " y=" + mouseY);
}
