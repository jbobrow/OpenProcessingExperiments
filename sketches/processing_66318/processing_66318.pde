
float circleY;
float circleX;
float vel = 20;


void setup() {
  size(500, 500);
  frameRate(30);
  noStroke();
  smooth();
}
void draw() {

  background(230, 191, 255);
  fill(180, 46, 131);
  noStroke();
  circleY += vel;
  circleX= circleX+6;

  ellipse(circleX, circleY, 90, 90);

  if  ((circleY > height-90|| circleY< 0)) { 
    vel=vel*-Y;
  }

  if (circleY>=500)
  {
    circleY=0;
  }
}
