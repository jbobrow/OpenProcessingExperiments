
void setup() {
    size(250, 250);
    frameRate(5);
}

x = 0;
void draw() {
    background(0);
    translate(width/2, height/2);
    rotate(PI/3.0 + x);
    rect(-26, -26, 52, 52);
    x+= -6;
}
