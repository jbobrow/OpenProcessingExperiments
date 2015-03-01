
float x, y;
float angle = 0;
float r =200;
float d =1;

void setup() {
  size(600, 600);
  background(255);
}

void draw() {

  x = r*sin(angle);
  y = r*cos(angle);

  stroke(0, 100);
  noFill();

  translate(width/2, height/2);
  rotate(angle);
  stroke(30, 60, 55, 25);
  ellipse(0, 0, x+300, y+200);

  angle += 10;

  if (r==0||r==100) {
    r = r-d;
    d = d*-1;
    println(x + ":"+y);
  }
}
