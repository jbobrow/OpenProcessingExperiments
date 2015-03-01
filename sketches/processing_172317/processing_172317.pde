
int numChecks = 1000;
Check[] checks = new Check[numChecks];
Radio[] buttons = new Radio[3];
void setup() {
size(500, 500);
int x = 40;
int y = 20;
for (int i = 0; i < numChecks; i++) {
checks[i] = new Check(x, y, 80, color(8, 81, 82, 160));
x += 15;
if (x > -10) {
x += 15;
y += 15;
buttons[0] = new Radio(10, 250, 70, color(8, 81, 82, 160), color(10, 100, 200, 100),
0, buttons);
buttons[1] = new Radio(100, 250, 70, color(80, 181, 82, 160), color(0),
1, buttons);
buttons[2] = new Radio (200, 250, 70, color(8, 181, 182, 160), color (0), 2, buttons);

}
}
}
void draw() {
background(0);
for (int i=0; i<numChecks; i++) {
checks[i].display();
buttons[0].display();
buttons[1].display();
buttons[2].display();
}
}
void mousePressed() {
for (int i = 0; i < numChecks; i++) {
checks[i].press(mouseX, mouseY);
buttons[0].press(mouseX, mouseY);
buttons[1].press(mouseX, mouseY);
buttons[2].press(mouseX, mouseY);
}
}




class Check {
int x, y; // The x- and y-coordinates
int size; // Dimension (width and height)
color baseGray; // Default gray value
boolean checked = false; // True when the check box is selected
Check(int xp, int yp, int s, color b) {
x = xp;
y = yp;
size = s;
baseGray = b;
}
// Updates the boolean variable checked
void press(float mx, float my) {
if ((mx >= x) && (mx <= x+size) && (my >= y) && (my <= y+size)) {
checked = !checked; // Toggle the check box on and off
}
}
// Draws the box and an X inside if the checked variable is true
void display() {
stroke(16, 205, 160, 100);

fill(200, 150, 100, 100);
ellipse(2*x, 2*y, 300, 300);
if (checked == true) {
  noStroke ();
  fill(150, 241, 40, 100);
ellipse(x+20, y+20, size/2, size/2);

}
}
}
class Radio {
int x, y; // The x- and y-coordinates of the rect
int size, dotSize; // Dimension of circle, inner circle
color baseGray, dotGray; // Circle gray value, inner gray value
boolean checked = false; // True when the button is selected
int me; // ID number for this Radio object
Radio[] others; // Array of all other Radio objects
Radio(int xp, int yp, int s, color b, color d, int m, Radio[] o) {
x = xp;
y = yp;
size = s;
dotSize = size + size/2;;
baseGray = b;
dotGray = d;
others = o;
me = m;
}
// Updates the boolean value press, returns true or false
boolean press(float mx, float my) {
if (dist(x, y, mx, my) < size) {
checked = true;
for (int i = 0; i < others.length; i++) {
if (i != me) {
others[i].checked = false;
}
}
return true;
} else {
return false;
}
}
// Draws the element to the display window
void display() {
noStroke();
fill(baseGray);
rect(x, y, size, size+20);
if (checked == true) {
fill(dotGray);
rect(x+130, y+130, dotSize/2, dotSize/2);
ellipse(x+230, y+230, dotSize/2, dotSize/2);
ellipse(x+330, y+130, dotSize/9, dotSize/9);
}
}


}


