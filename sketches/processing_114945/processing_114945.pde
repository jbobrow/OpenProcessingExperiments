
void setup() {
    size(400, 400);
    predatorP = {300, 30};
    preyP = {350, 350};
    rectMode(CENTER);
}

void draw() {
    predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
