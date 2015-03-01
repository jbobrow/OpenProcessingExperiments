
Button button;
void setup() {
size(100, 100);
// Inputs: x, y, size,
// base color, over color, press color
button = new Button(25, 25, 50,
color(204), color(255), color(0));
}
void draw() {
background(204);
stroke(255);
button.update();
button.display();
}
void mousePressed() {
button.press();
}
void mouseReleased() {
button.release();
}






class Button {
int x, y; // The x- and y-coordinates
int size; // Dimension (width and height)
color baseGray; // Default gray value
color overGray; // Value when mouse is over the button
color pressGray; // Value when mouse is over and pressed
boolean over = false; // True when the mouse is over
boolean pressed = false; // True when the mouse is over and pressed
Button(int xp, int yp, int s, color b, color o, color p) {
x = xp;
y = yp;
size = s;
baseGray = b;
overGray = o;
pressGray = p;
}
// Updates the over field every frame
void update() {
if ((mouseX >= x) && (mouseX <= x+size) &&
(mouseY >= y) && (mouseY <= y+size)) {
over = true;
} else {
over = false;
}
}
boolean press() {
if (over == true) {
pressed = true;
return true;
} else {
return false;
}
}
void release() {
pressed = false; // Set to false when the mouse is released
}
void display() {
if (pressed == true) {
fill(pressGray);
} else if (over == true) {
fill(overGray);
} else {
fill(baseGray);
}
stroke(255);
ellipse(width/2, height/2, size, size);
}
}



