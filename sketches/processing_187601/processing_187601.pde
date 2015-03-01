
void setup() {
size(400,400);
}
 
void draw() {
stroke(mouseX, 180, mouseY);
line(0, 0, mouseX, mouseY);
stroke(28,mouseX,mouseY);
line(20,63,mouseX,mouseY);
stroke(mouseX,mouseY,79);
line(200,145,mouseX,mouseY);
}
