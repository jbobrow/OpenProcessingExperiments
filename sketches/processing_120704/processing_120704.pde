
void setup() {
    size(500, 500);
    predatorP = {20,20};
    preyP = {350, 350};
    rectMode(CENTER);
}

void draw() {
    predator =ellipse(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}

