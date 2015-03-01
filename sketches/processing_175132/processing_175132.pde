
int circleMove=25;

void setup () {
size(400,400);
}

void draw () {
fill(0,255,255);
ellipse(circleMove,200,50,50);
circleMove+=3;
}
