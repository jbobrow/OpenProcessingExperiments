
void setup() {
size(300,300);
background (mouseX,mouseY);
}
void draw() {
 
stroke (mouseX, mouseY,255);
line (mouseX,mouseY,0,255);
 ellipse(mouseX, mouseY, 20, 20);
 stroke (255,mouseX,mouseX);
}
