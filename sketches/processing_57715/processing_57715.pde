
int hora, minuto, segundo;
boolean zoomedIn = true;
float zoom = 7;

void setup() {
    size(500, 500);
    smooth();
    stroke(255);
    noFill();
}

void draw() {
    background(0);

    if (zoomedIn) {
        if (zoom < 7) zoom++;
        translate(448, 245);
        scale(zoom);
        translate(-448, -245);
    } 
    else {
        if (zoom > 1) zoom--;
        translate(448, 245);
        scale(zoom);
        translate(-448, -245);
    }

    // Hours
    pushMatrix();
    translate(width/1.5, height/2);
    drawDisk(0, 23, 60, hour());
    popMatrix();

    // Minutes
    pushMatrix();
    translate(width/1.5-70, height/2);
    drawDisk(0, 59, 150, minute());
    popMatrix();

    // Seconds
    pushMatrix();
    translate(width/1.5-70, height/2);
    drawDisk(0, 59, 170, second());
    popMatrix();

    noFill();
    rect(390, 235, 60, 20);
    fill(255, 0, 0);
    text(":", 408, 249);
    text(":", 428, 249);
}

void drawDisk(int start, int end, int offset, int selected) {
    rotate(radians((360/(end-start+1)) * (0-selected)));

    for (int i = start; i <= end; i++) {
        if (i != 0) rotate(radians(360/(end-start+1)));
        if (i == selected)
            fill(255, 0, 0);
        else
            fill(36 * (7-zoom));

        text(nf(i, 2), offset, 0);
    }
}

void mouseClicked() {
    zoomedIn = !zoomedIn;
}


