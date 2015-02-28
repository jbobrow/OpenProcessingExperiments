
int radius;
float angle;

void setup() {
    size(600,600);
    radius = width/2;
    ellipse(radius,radius,width,height);
    strokeWeight(5);
    frameRate(120);
    stroke(random(255),random(255),random(255));
    angle = 0.0;
}

void draw() {
    line(radius,radius,radius+radius*cos(angle),radius+radius*sin(angle));
    angle = angle + 0.01;
    if (angle >= 6.28) {
        angle = 0.0;
        stroke(random(255),random(255),random(255));
    }
    
}
