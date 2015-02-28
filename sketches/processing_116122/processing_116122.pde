
int counter;

void setup() {
    size(800,600);
    predatorP = {100, 500};
    preyP = {600, 50};
    rectMode(CENTER);
}

void draw() {
    predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
