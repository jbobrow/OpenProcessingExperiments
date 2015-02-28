
void setup() {
    size(600, 400);
    background(255);
    smooth();
}

void draw() {

    int y1 = 100;
    int y2 = 300;
    float r1 = random(100,500);
    float r2 = random(100,500);
    for (int x = 20; x < width; x += 20) {        
        line(r1 , y1 , r2, y2);
    }
}
