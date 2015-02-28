
void setup() {
    size(400, 400);
}

void draw(){
    rect(mouseX, mouseY, mouseX, mouseY);
}


void keyPressed() {
    if (key =='k') {
        background(255, 0, 0);
    }

    else {
        background(0, 255, 0);
    }

    if (key =='l') {
        ellipse(50, 50, 50, 300);
 }
}
