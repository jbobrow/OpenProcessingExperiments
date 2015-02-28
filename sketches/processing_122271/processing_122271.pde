
void setup() {
    size(500, 500);
    float a = random(15,485);
    float b = random(15,485);
    float c = random(15,485);
    float d = random(15,485);
    predatorP = {a,b};
    preyP = {c,d};
    rectMode(CENTER);
}

void draw() {
    background(1);
    frameRate(random(10,60));
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
