
float X=(mouseX);
float Y=(mouseY);
float change=(1.5);
float R;
float G;
float B;
float Op;
void setup() {
  size (500, 500);

  frameRate(60);
  smooth();
}

void draw() {
  background(0, 0, 255);
  fill(R, G, B);
  rect(X, Y, 20, 130);
  line(X, Y+130, X, Y+200);
  line(X+20, Y+130, X+20, Y+200);
  fill(0, 255, 0, Op);
  ellipse(X, Y, 100, 100);
  fill(R, G, B);
  ellipse(X, Y+10, 20, 50);
  fill(R, G, B);
  ellipse(X+40, Y+10, 20, 50);

  X=mouseX;
  Y=mouseY;

  R=random(0, 255);
  G=random(0, 255);
  B=random(0, 255);
  Op=(255);

  R=R-change;
  G=G+change;
  Op=Op-change;
}


