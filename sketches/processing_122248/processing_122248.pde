
void setup() {
    size(500, 500);
    frameRate(2);
    rectMode(CENTER);

}

void draw() {
    background(204);
    predator = rect(random(0,500),random(0,500), 20, 20);
    prey = ellipse(random(0,500),random(0,500),20,20);
}
