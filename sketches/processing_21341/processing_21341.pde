
void setup() {
size(750, 750);
background(134,124,56);
strokeWeight(3);
}
void draw() {
if (mousePressed == true) { // If mouse is pressed
stroke(255); // set the stroke to white
}
else { // ,
stroke(75); 
}
rect(mouseX, mouseY, pmouseX, pmouseY);
line(mouseX, mouseY, pmouseX, pmouseY);
}

