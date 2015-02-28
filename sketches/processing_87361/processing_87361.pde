
float r,g,b;
float l;

void setup() {
size(700,700);
background(255);
}
void draw() {
r=random(0,255);
g=random(100);
b=random(100,200);
l=random(20,80);
// Body
stroke(255-l);
strokeWeight(40-l/2);
fill(r,g,b);
rectMode(CENTER);
rect(mouseX,mouseY,l,l);
}

