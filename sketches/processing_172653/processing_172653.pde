
int circleX=110;
int circleY=110;

void setup() {
  size (400, 400);
}

void draw() {
  background(255);
  stroke (0);
  fill (255);
ellipse(circleX, circleY, 50, 50);
fill(#F73200);
ellipse(circleX, circleY, 60, 60);
fill(255);
ellipse(circleX, circleY, 30, 30);
fill (#F73200);
ellipse(circleX, circleY, 10, 10);

circleX= circleX + 1;
}

