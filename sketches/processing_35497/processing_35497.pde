
void setup() {
size(500, 500);
background(0);
smooth();
frameRate(100);
}
void draw() {
stroke(mouseX, 9 , mouseY); 
float distance = dist(pmouseX, pmouseY, mouseX, mouseY);
if (mousePressed) {
float maxStroke = 15;  
strokeWeight(maxStroke - constrain(distance, 0, maxStroke));
fill(88);
} else {
fill(255);
float maxStroke = 15;
}
ellipse(mouseX, mouseY, 100, 100);
}
                
                
