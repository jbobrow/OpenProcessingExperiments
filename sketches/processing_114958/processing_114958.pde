
void setup() {
    size(400, 400);
    predatorP = {350, 350};
    preyP = {30, 30};
    rectMode(CENTER);
}

void draw() {
    predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
