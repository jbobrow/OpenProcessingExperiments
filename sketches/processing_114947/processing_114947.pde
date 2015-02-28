
void setup() {
    size(400, 400);
    predatorP = {50, 50};
    preyP = {150, 150};
    rectMode(CENTER);
}

void draw() {
    predator = rect(predatorP[0], predatorP[1], 90, 10);
    prey = ellipse(preyP[0],preyP[1],10,90);
}
