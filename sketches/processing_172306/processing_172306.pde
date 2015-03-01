
int[] x = new int[0];
int[] y = new int[0];
void setup() {
size(300, 300);
}
void draw() {
background(50, 76, 96);
stroke(0);
noFill();
beginShape();
for (int i = 0; i < x.length; i++) {
vertex(x[i], y[i]);
bezierVertex (x[i], y[i], x[x.length-1], y[x.length-1], x[y.length-1], y[y.length-1]);
vertex (x[i], y[i]);
vertex (x[i], y[i]);
bezierVertex (x[i], y[i], x[x.length/2], y[x.length/2], x[y.length/2], y[y.length/2]);
}
endShape();
// Show the next segment to be added
if (x.length >= 1) {
stroke(255);
line(mouseX, mouseY, x[x.length-1], y[x.length-1]);
}
}
void mousePressed() { // Click to add a line segment
x = append(x, mouseX);
y = append(y, mouseY);
}
void keyPressed() { // Press a key to save the data
String[] lines = new String[x.length];
for (int i = 0; i < x.length; i++) {
lines[i] = x[i] + "\t" + y[i];
}
saveStrings("lines.txt", lines);
exit(); // Stop the program
}


