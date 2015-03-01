
void setup() {
size(400,400);
background(255,255,0);
}

void draw() {
fill(random(1,255),255,255);
if(mousePressed == true) {
ellipse(mouseX,mouseY,20,20)
}

}
