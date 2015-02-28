
float y=40;
float x=10;

void setup() {

  size(500, 600, P2D);
  background(0);
}

void draw() {
  int t=millis();
  int s =second();

  translate(250, 300);
  rotate(PI/x*y*t);
 
  //shearX(PI/4*x/80);
  strokeWeight(t%7);
  stroke(x);
  fill(t%255);
  scale(.06);
  translate(100, 500);

  rect(x, y, 100, 100);
  rect(x, y, t%150, 10);

  x=random(5, 500);
  y=random(5, 600);
  x++;
  y++;

}



