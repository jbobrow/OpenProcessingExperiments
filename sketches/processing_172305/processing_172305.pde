
int[] x = new int[0];
int[] y = new int[0];
void setup() {
size(300, 300);


}
void draw() {
background(0);
stroke(30, 45, 90);
noFill();
beginShape();
for (int i = 0; i < x.length; i++) {
rect(x[i], y[i], x[x.length-1], y[x.length-1]);
}
endShape();
// Show the next segment to be added
if (x.length >= 1) {
stroke(255);
rect(mouseX, mouseY, x[x.length-1], y[x.length-1]);
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

saveStrings("timekeys.txt", lines);
exit();

}



