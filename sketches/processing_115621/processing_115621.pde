
float angle;

void setup() {
    size(601,601);
    ellipse(300,300,600,600);
    frameRate(240);
    angle = 0,0;
    stroke(random(255),random(255),random(255));
}

void draw() {
    line(300,300,300+300*cos(angle),300+300*sin(angle));
    angle = angle + 0.001;
    if (angle >= TWO_PI) {
        angle = 0,0;
        stroke(random(255),random(255),random(255));
    } 
}
