
void setup() {
size(500,500);
    background(255);
smooth();

}
void draw() {
  

// Body
strokeWeight(abs(mouseX-pmouseX)); //speed mouse is moving
line(pmouseX,pmouseY,mouseX,mouseY);
}


