
void setup() {
size(800,400);  
background(255);
}


void draw() { 
stroke(random(255),random(255),random(255)); 
strokeWeight(3);
point(mouseX, mouseY);
}
