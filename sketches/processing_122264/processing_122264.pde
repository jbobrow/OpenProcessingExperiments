
void setup() {
    frameRate(30);
    x=random(0,500);
    y=random(0,500);
    size(500, 500);
    predatorP = {x,y};
    preyP = {y,x};
    rectMode(CENTER);
}

void draw() {
    background(204);
    if (predatorP[0] > preyP[0])
        predatorP[0]--;
    else if(predatorP[0] < preyP[0])
        predatorP[0]++;

    if (predatorP[1] > preyP[1])
        predatorP[1]--;
    else if(predatorP[1] < preyP[1])
        predatorP[1]++;
    predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}

