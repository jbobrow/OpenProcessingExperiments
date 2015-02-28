
void setup()
{
  size(600, 600);
  background(255);
}

float c = 0;
float s = 1;

void draw() {
  float x = random(100, 500);
  float y = random(100, 500);
  if(sq(x-width/2) + sq(y-height/2) <= sq(200)) {
    stroke(255, 0, 0);
    c = c + 1;
  }
  else {
    stroke(0, 0, 255);
    s = s + 1;
  }
  strokeWeight(6);
  point(x, y);
  fill(255);
  noStroke();
  rect(0, 0, width, 20);
  fill(0);
  float sq = c + s;
  float pi = (4*c)/sq;
  textSize(14);
  text(/*"pi = " + */pi, 2, 14);
  text(/*"circle = " + */c, 200, 14);
  text(/*"square = " + */sq, 300, 14);
}
