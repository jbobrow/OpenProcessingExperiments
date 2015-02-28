
void setup(){
    size(500,500);
    predatorP = {30,30};
    preyP = {350,350};
    rectMode(CENTER);
    frameRate(1);
}

void draw(){
    background(204);
    predatorP = {random(0,500),random(0,500)};
    preyP     = {random(0,500),random(0,500)};
    
    predator = rect(predatorP[0],predatorP[1],20,20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}
