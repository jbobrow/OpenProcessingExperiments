
import netscape.javascript.*;
void setup() {
size(600, 600);
background (0);
strokeWeight(1);
smooth();
stroke(255);
}
void draw() {
line(mouseX, mouseY, pmouseX, pmouseY);
}

