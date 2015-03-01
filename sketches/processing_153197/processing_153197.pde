
void setup() {
    size(1200, 800);
    background(255);

}




void mouseClicked() {
    background(255);
    for (int y = 0; y < height; y += 87) {
        if (y % 2) {

            renderRows(y);

        } else {
            pushMatrix();
            translate(54, 0);
            renderRows(y);
            popMatrix();
        }

    }
    noLoop();

}



void renderRows(y) {
    float r = random(0, 1);
    for (int x = 0; x < width; x += 108) {

        if (r <= 0.3) { // CHANGE BACK TO 0.5
            squareKnot(x, y);
        } else if (r > 0.3 && r <= 0.6) {
            halfKnot(x, y);
        } else {
            cord(x, y);
        }



    }


}


void squareKnot(x, y) {

    pushMatrix();
    translate(x, y);
    rect(0, 0, 87, 87);
    popMatrix();

}

void halfKnot(x, y) {
    pushMatrix();
    translate(x, y);
    rect(0, 0, 87, 87);
    popMatrix();
}

void cord(x, y) {
    pushMatrix();
    translate(x, y);
    rect(0, 0, 87, 87);
    popMatrix();
}
