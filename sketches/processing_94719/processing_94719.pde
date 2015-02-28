
int degree;
float maxColor;
float lineColor;  // hue
int minLineLength;
int maxLineLength;
int lineLength;
float lineGrowth;

void setup() {
    maxColor = 360;
    colorMode(HSB, maxColor, 1, 1, 1);
    size(500, 500);
    background(0, 1, 0, 1);

    degree = 0;
    lineColor = 0;
    minLineLength = 30;
    maxLineLength = 240;
    lineLength = 100;
    lineGrowth = 0;
}

void draw() {
    degree = (int)(degree + 3 + random(4)) % 360;
    lineColor = (lineColor + random(0, 5)) % maxColor;
    
    lineLength += lineGrowth;
    int factor = (random(minLineLength, maxLineLength) < lineLength) ? -1 : 1;
    lineGrowth = lineGrowth/3 + factor * random(0, 5);
    
    stroke(0, 1, 0, 0.5);
    strokeWeight(5);
    drawLine(250, 250, degree, maxLineLength);
    
    stroke(lineColor, 1, 1, 1);
    strokeWeight(2);
    drawLine(250, 250, degree, lineLength);
}

void drawLine(int startX, int startY, float degree, int len) {
    line(
        startX, startY,
        startX + cos(radians(degree)) * len, startY+sin(radians(degree))*len
        );
}
