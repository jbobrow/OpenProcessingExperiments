
void setup() {
    size(400,400);
    }

void draw() {
if (mousePressed){
    ellipse(mouseX,mouseY,50,50);
    fill(50,60,70);
    }
else {
    ellipse(mouseX, mouseY, 50,50);
    fill (150,150,150);
    }
}
