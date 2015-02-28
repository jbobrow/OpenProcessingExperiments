
void setup() {
size(480, 480);
stroke(0);
background(192, 64, 0);
smooth();
}
void draw() {
if (mousePressed) { 
fill(0);
} else {
fill(255);
} ellipse(mouseX, mouseY, mouseX-mouseY, mouseY-mouseX);
}

void mousePressed() {
background(192, 64, 0);
}  
                
