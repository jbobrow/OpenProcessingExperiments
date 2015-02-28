
int rows = 10, cols = 10;

void setup() {
    size(400, 400);
    background(0x66);
}

void draw() {
    float t = millis() * 1e-3;
    
    float[] posX = new float[rows * cols];
    float[] posY = new float[rows * cols];
    
    for (int i = 0; i < rows; i++) {
        for (int j = 0; j < cols; j++) {
            int k = i * cols + j;
            posX[k] = j * 40 + 20 + 10 * cos(t + i * j);
            posY[k] = i * 40 + 20 + 10 * sin(t + i + j);
        }
    }

    //background(0xee);
    fill(0x66, 0x02);
    rect(0, 0, width, height);
    stroke(0xff);
    for (int i = 0; i < rows - 1; i++) {
        for (int j = 0; j < cols - 1; j++) {
            int k = i * cols + j;
            line(posX[k], posY[k], posX[k + 1], posY[k + cols]);
        }
    }
}
