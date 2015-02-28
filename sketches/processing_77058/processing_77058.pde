
float angle = 0.0;
float xpos;
float ypos;
float scalar = 100;


void setup() {
  size(400, 400);
  background(15, 28, 45);
}

void draw() {

  float valorSeno = sin (angle);
  xpos++;
  ypos++;

  float grises = map(valorSeno, -1, 1, 200, 255);
  
  stroke(grises, 30);
  strokeWeight(random(1, 5));
  noFill();
  ellipse(xpos, ypos, random(1, 2)*scalar, random(1, 2)*scalar);

  if ((xpos > width+120) && (ypos > height+120)) {
    ypos = 0;
    xpos = 0;
  }

  scalar += 0.09;
  angle += 0.5;
}
