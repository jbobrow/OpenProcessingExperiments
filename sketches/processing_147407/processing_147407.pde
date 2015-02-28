
int circleY = 100;
int circleX = -25;

void setup() {
size(200,200);
}

void draw() {
background(255);
while (circleX < 10){
stroke(0);
fill(175);
ellipse(circleX, circleY, 50, 50);
circleX = circleX + 1;
}
}

