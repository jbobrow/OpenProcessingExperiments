
int angle = 0;

void setup() { 
size(500, 500); 
smooth(); 
noStroke(); 
fill(0);
background(0);
}

void draw() {
angle += 10;
float val = cos(radians(angle)) * 6.0;
for (int a = 0; a < 360; a += 75) {
float xoff = cos(radians(a)) * val;
float yoff = sin(radians(a)) * val;
fill(100, 240, 150);
ellipse(mouseX + xoff, mouseY + yoff, val/4, val/2);
}
fill(100, 255, 100);
ellipse(mouseX, mouseY, 2, 2);

}


