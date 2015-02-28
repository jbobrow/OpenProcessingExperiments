
void setup() {
  size(600, 600);
  fill(255);
  noStroke();
  background(0);
  smooth();
  //noLoop();
}
float xp=0;
float yp=0;
float x=0;
float y=0;

void draw() {
  background(0);
  ellipse(width/2, height/2, 10, 10);
  for (int t= 0; t <360;t+=20) {

    xp=x;
    x = mouseX * cos(radians(t));

    yp = y;
    y = mouseY * sin(radians(t));

    ellipse(width/2+x, height/2+y, 10, 10);
    stroke(255);

    if (mousePressed) {
      line(width/2, height/2, width/2+x, height/2+y);

      line(width/2+xp, height/2+yp, width/2+x, height/2+y);
    }
  }
}


