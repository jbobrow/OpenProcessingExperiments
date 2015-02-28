
int ROWS = 6;
int COLS = 6;

void wedge(int x, int y, int width, int height, int orient) {
    switch (orient) {
    case 0: // NE
        arc(x, y + height, 2 * width, 2 * height, 1.5 * PI, TWO_PI);
        break;
    case 1: // NW
    arc(x + width, y + height, 2 * width, 2 * height, PI, 1.5 * PI);
        break;
    case 2: // SW
        arc(x + width, y, 2 * width, 2 * height, 0.5 * PI, PI);
        break;
    case 3: // SE
        arc(x, y, 2 * width, 2 * height, 0, 0.5 * PI);
        break;
    }
}

int randomOrient() {
    return int(random(4));
}

int[][] wedgeOrient = new int[ROWS][COLS];

void mouseClicked() {
    int i = int(ROWS * mouseY / height);
    int j = int(COLS * mouseX / width);
    wedgeOrient[i][j] = (wedgeOrient[i][j] + 1) % 4;
    redraw();
}

void setup() {
    size(400, 400);
    for (int i = 0; i < ROWS; i++) {
        for (int j = 0; j < COLS; j++) {
            wedgeOrient[i][j] = randomOrient();
        }
    }
    noLoop();
}

void draw() {
    background(0xcc, 0x22, 0x00);
    noStroke();
    fill(0xff);
    for (int i = 1; i < ROWS - 1; i++) {
        float y = i * height / ROWS;
        for (int j = 1; j < COLS - 1; j++) {
            float x = j * width / COLS;
            wedge(x + 2, y + 2, float(width) / COLS - 4, float(height) / ROWS - 4, wedgeOrient[i][j]);
        }
    }
}
