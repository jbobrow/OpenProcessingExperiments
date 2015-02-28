
void setup() {
    size(640, 370);
}

void draw() {
    for (i = 0; i < height; i+= 20) {
        fill(127, 30, 56);
        rect (0, i, width, 50);
        fill (255)
        rect (i, 0, 10, height);
    }
}
