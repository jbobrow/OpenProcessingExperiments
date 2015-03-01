
void setup() {
size(300,300);

}
void draw() {
stroke (mouseX,255,mouseY);
line (mouseX,mouseY,0,255);
line(0, 0, mouseX, mouseY);

}
