
void setup() {
size(900,520);  
background(255);
}


void draw() { 
stroke(random(255),random(255),random(255)); 
strokeWeight(2);
line(mouseX, random(1000), mouseY*2, random(200));
}


