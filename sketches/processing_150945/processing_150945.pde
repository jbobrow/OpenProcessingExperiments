
void setup() {
size (500,500)
background(0)


}

void draw() {

stroke(255)
fill(128)
ellipse(mouseX, mouseY, 50, 50)

stroke(0)
fill(0)
triangle(mouseX, mouseY, 40, 40, 40)

}
