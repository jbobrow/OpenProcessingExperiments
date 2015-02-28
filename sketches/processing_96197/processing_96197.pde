
void setup() {
size(660, 320);

}

void draw() {
if (mousePressed) {
fill(0);
} else {
fill(255);
background(255); // Setting the background to white
stroke(1); // Setting the outline (stroke) to black
fill(255,0,0); // Setting the interior of a shape (fill) to grey 
rect(50,50,75,100); // Drawing the rectangle

}
ellipse(mouseX, mouseY, 90, 80);
}
