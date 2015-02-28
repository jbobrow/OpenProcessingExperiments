
void setup(){
size(200, 200);
background(255, 48, 48);
}

void draw(){
fill(mouseX,5, mouseY, 50);
stroke(0, mouseX, mouseY, 20);
ellipse(mouseX, mouseY, 20, 20);
ellipse(10, 10, 30, 30);
ellipse(50, 50, 70, 70);
}


