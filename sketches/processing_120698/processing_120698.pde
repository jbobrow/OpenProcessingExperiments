

void setup() {
    size(500, 500);
    predatorP = {x, y};
    rectMode(CENTER);
}

void draw() {
    fill(255,0,0,300);
        x = random(30,470);
        y = random(30,470); 
    predator = ellipse(predatorP[x], predatorP[y], 20, 20);
}
