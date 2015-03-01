
void setup(){
size(500,250);
}

void draw(){
background(30);
strokeWeight(4);
stroke(30);
fill(54, 166, 70);
ellipse(250, 100, mouseX, mouseX);
fill(255);
rotate(0.2); 
rect(200, 0, 50, mouseX-50);
fill(255);
rotate(-0.2); 
rect(0, 50, mouseX, 50);
fill(255);
rect(100, 0, 50, mouseY);
}


