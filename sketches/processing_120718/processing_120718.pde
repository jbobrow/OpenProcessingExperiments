
void setup() {
    size(500, 500);
    frameRate (2);
    rectMode(CENTER);
}

void draw() {
    background(204);
    float x = random(50,450);
    float y = random(50,450);
　　ellipse( x, y, 20, 20);
　　
}
