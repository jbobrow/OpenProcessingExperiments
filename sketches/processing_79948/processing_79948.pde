
int squareSize = 100;
int squareSpacing = 10;
float scaleFactor = 1.2;
float zoomFactor = 0.005;

void setup() {
       size(640, 480);
} 

void draw() {
    background(192, 64, 0);
    scaleFactor -= zoomFactor;
    if (scaleFactor < -11) {
        noLoop();
    }
    pushMatrix();
    translate(width / 2, height / 2);
    scale(pow(2, scaleFactor));
    fill(255);
    doBoxes();
    popMatrix();
}

void mousePressed() {
    noLoop();
}

void mouseReleased() {
    scaleFactor = 1.2;
    loop();
}

void doBoxes() {
    for (int i=-4.5;  i <= 4.5; i++) {
        for (int j=-4.5; j <= 4.5; j++) {
           rect((squareSize+squareSpacing)*i - (squareSize / 2),
                (squareSize+squareSpacing)*j - (squareSize / 2),
                squareSize, squareSize);
        }
    }
}
