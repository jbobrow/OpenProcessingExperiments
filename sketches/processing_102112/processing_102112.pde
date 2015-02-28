
int circleX = 0;
int circleY = 100;

void setup () {
size(200,200);
}

void draw() {
 background (255);
 stroke(0);
 fill(175);
 ellipse(circleX, circleY, circleX + 50, circleX + 50);

 circleX = circleX + 1; 
}
