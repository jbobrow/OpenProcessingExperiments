
void setup() {
    size(500, 500);
    frameRate(60);
    predatorP = {30, 30};
    preyP = {350, 350};
    rectMode(CENTER);
}

void draw() {
    background(204);
    float x = random(0,500);
    float y = random(0,500);
    predator = ellipse(x,y,20,20);
}
