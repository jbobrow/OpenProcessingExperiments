
void setup () {
size (2000,4000);
frameRate(40);
}

void draw() {
  fill (mouseX,mouseY,random(14),random(50));
triangle(mouseX,mouseY ,random(120),random(220),random(30),random(250));
ellipse(mouseX, mouseY,random(400),random(200));

}


