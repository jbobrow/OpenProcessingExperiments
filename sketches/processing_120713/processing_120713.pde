
void setup() {
    size(500, 500);
    frameRate(10);
}

void draw() {
    background(204);
    int x = random(0,500);
    int y = random(0,500); 
ellipse(x, y, 20, 20);
}
