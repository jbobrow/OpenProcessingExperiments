
int raio=200;
int centro=250;

void setup() {
  size(500, 500);
}

//PONTEIRO
void ponteiro() {
  beginShape();
  vertex(-20, -20);
  vertex(20, -20);
  vertex(0, 75);
  endShape(CLOSE);
}

void draw() {
  background(255);
  int s =second();
  float ang;

  fill(255);
  ellipse(width/2, height/2, raio*2, raio*2);

  ang=(TWO_PI/60)*s;
  translate(centro, centro);
  fill(0, 0, 0);
  translate(raio*cos(ang-PI/2), raio*sin(ang-PI/2 ));
  rotate(ang);
  ponteiro();
}

