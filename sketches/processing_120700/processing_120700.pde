
void setup() {
    size(500, 500);
    predatorP = {30, 30};
    preyP = {350, 350};
    rectMode(CENTER);
}

void draw() {
    predator = ellipse(predatorP[0], predatorP[1], 20, 20);
    prey = ellipse(preyP[0],preyP[1],20,20);
}

void setup() 
    size(500, 500);
    frameRate(20);
}

void draw() {
   
　 x=random(0,500);
    y=random(0,500);
    ellipse(x,y,20,20);
}

