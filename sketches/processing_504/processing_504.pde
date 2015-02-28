
void setup()
{
size(400, 400);
background(0, 90, 0);
smooth();
}

void draw() {
stroke(72, 0, 56);
strokeWeight (10);
fill (125,0,145);

if(mousePressed) {
rect(mouseX, mouseY, pmouseX/2, pmouseY/2);
}
}

