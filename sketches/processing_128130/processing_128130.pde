
void setup() {
    frameRate(20);
    size(500, 500);
    predatorP = {130, 230};
    preyP = {350, 350};
    rectMode(CENTER);
}
void draw() {
    background(204);
    if (predatorP[0] > preyP[0])
    predatorP[0]--;
    else if(predatorP[0] < preyP[0])
    predatorP[0]++;
    
    slant = (preyP[1]-predatorP[1])/ (preyP[0]-predatorP[0]);if (predatorP[1] > preyP[1])
            predatorP[1]-=abs(slant);
else if (predatorP[1] < preyP[1])
            predatorP[1]+=abs(slant);
 
 　predator = rect(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}

