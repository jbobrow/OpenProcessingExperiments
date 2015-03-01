
void setup() {
size(600, 400);
background(244,250,240);
smooth();
}
void draw() {
rectMode(CENTER);
fill(color(116, 193, 206,160));
rect(300,200,mouseX,mouseY);
ellipseMode(CENTER);
fill(color(105, 235, 209,106));
ellipse(400,200,mouseX, mouseY);
ellipseMode(CENTER);
fill(color(252, 114, 150,106));
ellipse(300,100,mouseX, mouseY);
ellipseMode(CENTER);
fill(color(47, 180, 240,80));
ellipse(300,300,mouseX, mouseY);
ellipseMode(CENTER);
fill(color(227, 166, 242,80));
ellipse(200,200,mouseX, mouseY);
}


