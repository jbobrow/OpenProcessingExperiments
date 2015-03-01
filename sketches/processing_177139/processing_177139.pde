
void setup() { 
size(1000,1000);
smoother();

}

void draw() {
if (mousePressed) { 
fill(30);
} else { 
fill(255);

}

ellipse(mouseX,mouseY,80,80);
} 

