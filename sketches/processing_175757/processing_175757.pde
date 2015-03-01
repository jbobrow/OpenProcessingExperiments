
//Creates a window 1000 pixels wide by 1000 pixels high and then starts drawing white circles at the position of the mouse. When the mouse button is pressed, the circle color changes to black.
void setup() { size(1000, 1000);
smooth();
}

void draw() {
 if (mousePressed) {
 fill (0);
} else {
 fill(255);
}
ellipse(mouseX, mouseY, 80, 80);
}
