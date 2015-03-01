
// Normal Polar Distribution by John Clavin

Dot[] dots;
int numOfDots = 200;
int frameNumberCount = 0;
float colorVar;
float redVar;
float grnVar;
float bluVar;

void setup() {
    size(500, 500);
    frameRate(16);
    noStroke();
    background(180);
    dots = new Dot[numOfDots];
    for (int i = 0; i < dots.length; i++) {
        dots[i] = new Dot();
    }
}

void draw() {
    for (int j = 0; j < numOfDots; j++) {
        Dot a = dots[j];
        a.calculateX_distribution(flipCoin());
        a.calculateY_distribution(flipCoin());
    }
    for (int i = 0; i < numOfDots; i++) {
        Dot b = dots[i];
        colorVar = dist(b.xLocation, b.yLocation, width/2, height/2);
        if (50 > (int)random(100)) {
            redVar = 200 - colorVar;
            grnVar = 0;
            bluVar = 0;
        } else if (50 > (int)random(100)) {
            redVar = 0; 
            grnVar = 200 - colorVar;
            bluVar = 0;
        } else {
            redVar = 0; 
            grnVar = 0;
            bluVar = 0;
        } 
        fill(redVar, grnVar, bluVar);
        ellipse(b.xLocation, b.yLocation, 3, 3);
    }
    if (frameNumberCount < 250) {
        frameNumberCount++;
    } else {
        noLoop();
    }
}

void mousePressed() {
    reStart();
}

int flipCoin() {
    int rand;
    int headCount = 0;
    for (int c = 0; c < 10000; c++) {
        rand = (int)random(1000);
        if (rand >= 500) {
            headCount += 1;
        }
    }
    return headCount;
}

void reStart() {
    frameNumberCount = 0;
    background(180);
    loop();
}

class Dot {
    int adjustedCount;
    int xLocation;
    int yLocation;

    void calculateX_distribution(int heads) {
        adjustedCount = heads - 4750;
        xLocation = adjustedCount;
    }
    void calculateY_distribution(int heads) {
        adjustedCount = heads - 4750;
        yLocation = adjustedCount;
    }
}



